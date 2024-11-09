extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var is_limited := true

func _process(delta):
	if $Area2D.overlaps_area(""):
		print("nice")
	
	if is_limited:
		if self.position.x > 400:
			self.position.x = -400
		if self.position.x < -400:
			self.position.x = 400

func _physics_process(delta):
	var direction := Input.get_vector("left", "right", "ui_up", "ui_down")
	if direction:
		velocity.x = lerp(velocity.x,direction.x * SPEED,delta)
	else:
		velocity.x = lerp(velocity.x,move_toward(velocity.x, 0, SPEED),delta * 10)

	move_and_slide()
