extends CharacterBody2D

const SPEED = 700.0
var nb_food_eaten: int = 0
var max_food_eaten: int = 10

@export var nb_beans_eaten_label: RichTextLabel

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_mouth_area_2d_body_entered(body: Node2D):
	if "type_" in body and body.type_ == "bean":
		nb_food_eaten += 1
		nb_beans_eaten_label.text = "%d / 10" % nb_food_eaten
		body.queue_free()
	elif "type_" in body and body.type_ == "cockroach":
		nb_food_eaten -= 1
		nb_beans_eaten_label.text = "%d / 10" % nb_food_eaten
		body.queue_free()
	


func _on_fallen(body: Node2D):
	if "type_" in body and body.type_ == "bean":
		nb_food_eaten -= 1
		nb_beans_eaten_label.text = "%d / 10" % nb_food_eaten
		body.queue_free()
	elif "type_" in body and body.type_ == "cockroach":
		body.queue_free()
