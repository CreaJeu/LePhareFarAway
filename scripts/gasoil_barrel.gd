extends Node2D


func _ready() -> void:
	$Interactable.connect("interactable_used", do_action)


func do_action(interaction_name: String):
	GameState.has_barrel = true
	queue_free()
