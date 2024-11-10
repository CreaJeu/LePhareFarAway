extends Node2D

@export var player: CharacterBody2D
@export var step = -750

func _ready() -> void:
	$Interactable.connect("interactable_used", do_action)

func do_action(interaction_name: String):
	player.position.y += step
	$AudioStreamPlayer.play()
