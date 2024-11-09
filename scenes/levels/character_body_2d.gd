extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity.x = lerp(velocity.x,direction.x * SPEED,delta)
		velocity.y = lerp(velocity.y,direction.y * SPEED,delta)
	else:
		velocity.x = lerp(velocity.x,move_toward(velocity.x, 0, SPEED),delta * 10)
		velocity.y = lerp(velocity.y,move_toward(velocity.y, 0, SPEED),delta * 10)

	move_and_slide()
