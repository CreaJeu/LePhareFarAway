extends Node2D

var game_started: bool = false
var gasoil_level: float = 0.0
var fill_speed: int = 10
var fill_style_box: StyleBoxFlat

func _ready() -> void:
	fill_style_box = $ProgressBar.get_theme_stylebox("fill")
	$Interactable.connect("interactable_used", do_action)


func do_action(interaction_name: String):
	if GameState.has_barrel:
		game_started = true
		GameState.read_conversation(6)
	else:
		GameState.read_conversation(7)


func update_gasoil_level():
	$ProgressBar.value = int(gasoil_level)
	if gasoil_level > 33 and gasoil_level < 66:
		fill_style_box.bg_color = Color(1, 0.5, 0)
	elif gasoil_level >= 66:
		fill_style_box.bg_color = Color(0.475, 0.733, 0.463)


func _process(delta):
	if game_started:
		if Input.is_action_pressed("fill_gasoil"):
			gasoil_level += delta * fill_speed
			update_gasoil_level()
		if gasoil_level >= 100:
			game_started = false
			GameState.is_gasoil_lamp_filled = true
			GameState.remove_mission(4)
			GameState.add_mission(5)
