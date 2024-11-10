extends Node2D

func _ready() -> void:
	$Interactable.connect("interactable_used", do_action)


func do_action(interaction_name: String):
	print("read conversation")
	GameState.read_conversation(1)
	GameState.remove_mission(1)
