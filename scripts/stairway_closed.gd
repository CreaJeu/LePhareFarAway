extends Node2D

@export var player: CharacterBody2D
@export var step = -750

var is_open: bool = false

func _ready() -> void:
	$Interactable.connect("interactable_used", do_action)

func do_action(interaction_name: String):
	if GameState.has_keys:
		if is_open:
			player.position.y += step
		else:
			$Sprite2DOpen.visible = true
			$Sprite2DClose.visible = false
			is_open = true
	else:
		GameState.read_conversation(5)
