extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Interactable.connect("interactable_used", do_action)

func do_action(interaction_name: String):
	print("A new hand touches the beacon!")
