extends Node2D


func _ready() -> void:
	$Interactable.connect("interactable_used", do_action)


func do_action(interaction_name: String):
	GameState.emit_signal("play_sound", "PickupKeys")
	GameState.has_keys = true
	GameState.remove_mission(2)
	queue_free()
