extends Camera2D

@export var player := CharacterBody2D
var is_limited : bool

func _ready() -> void:
	is_limited = player.is_limited

func _process(delta):
	self.position.x = player.position.x
	self.position.y = lerp(self.position.y,player.position.y,delta*2)
