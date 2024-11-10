extends Node2D

var game_started: bool = false
var gasoil_level: float = 0.0
var fill_speed: int = 10

func _ready() -> void:
	$Interactable.connect("interactable_used", do_action)


func do_action(interaction_name: String):
	if GameState.has_barrel:
		game_started = true
		GameState.read_conversation(6)
	else:
		GameState.read_conversation(7)


func _process(delta):
	if game_started:
		if Input.is_action_pressed("fill_gasoil"):
			gasoil_level += delta * fill_speed
			$RichTextLabel.text = '%d / 100' % int(gasoil_level)
		if gasoil_level >= 100:
			game_started = false
			GameState.is_gasoil_lamp_filled = true
			GameState.remove_mission(4)
			GameState.add_mission(5)
			GameState.read_conversation(2)
