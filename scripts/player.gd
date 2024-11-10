extends CharacterBody2D

const SPEED = 500.0

@export var is_limited := true
@onready var  _animation_player := $WorldModel/AnimatedSprite2D

func _ready() -> void:
	GameState.connect("pause_game", restart_animation)

func restart_animation() -> void:
	_animation_player.play("default")

func _process(delta):
	if is_limited:
		if self.position.x > 2016:
			self.position.x = -2016
		if self.position.x < -2016:
			self.position.x = 2016
		

func _physics_process(delta):
	var direction := Input.get_vector("left", "right", "ui_up", "ui_down")
	if direction:
		#velocity.x = lerp(velocity.x,direction.x * SPEED,delta)
		velocity.x = direction.x * SPEED
	else:
		velocity.x = lerp(velocity.x,move_toward(velocity.x, 0, SPEED),delta * 10)
		
	if Input.is_action_pressed("left"):
		_animation_player.play("walk")
		_animation_player.flip_h = true
		
		
	elif Input.is_action_pressed("right"):
		#print_debug("action pressed right")
		_animation_player.play("walk")
		_animation_player.flip_h = false
		
	else:
		_animation_player.play("default")
		

	move_and_slide()
