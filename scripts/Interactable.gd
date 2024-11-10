extends Node2D

var playerInZone: bool = false

@export var sizeX : float
@export var sizeY : float
@onready var collision: CollisionShape2D = $Area2D/CollisionShape2D

func _ready():
	collision.shape.size.x = sizeX
	collision.shape.size.y = sizeY

func _process(delta):
	if Input.is_action_just_pressed("interact") and playerInZone:
		# TODO: do item action
		print("Do interactable action")
		$"..".do_action()


func _on_area_2d_body_entered(body):
	print("Entered interactable zone")
	playerInZone = true


func _on_area_2d_body_exited(body):
	print("Exited interactable zone")
	playerInZone = false
