extends Node2D

signal interactable_used(interaction_name: String)

var playerInZone: bool = false

@export var parent: Sprite2D
@export var interaction_name: String = ""
@onready var collision: CollisionShape2D = $Area2D/CollisionShape2D

func _ready():
	var shape: RectangleShape2D = RectangleShape2D.new()
	shape.size = parent.texture.get_size() * parent.scale
	collision.shape = shape
	
	# Place label on top of the sprite and center text
	$Label.position.y -= ((parent.texture.get_size() * parent.scale).y / 2) + 30
	$Label.position.x -= $Label.size.x / 2
	$Label.visible = false


func _process(delta):
	if Input.is_action_just_pressed("interact") and playerInZone:
		# Interactable node emits the signal with its name. It's parent must capture this signal and do an action with it
		# The name is probably not useful
		interactable_used.emit(interaction_name)


func _on_area_2d_body_entered(body):
	print("Entered interactable zone")
	playerInZone = true
	$Label.visible = true


func _on_area_2d_body_exited(body):
	print("Exited interactable zone")
	playerInZone = false
	$Label.visible = false
