extends Node2D

@export var msgWriter: PanelContainer


func _ready() -> void:
	$Interactable.connect("interactable_used", do_action)


func do_action(interaction_name: String):
	print("read conversation")
	GameState.read_conversation(msgWriter, 1)
