extends Node2D

@export var msgWriter: PanelContainer
var game_started: bool = false

func _ready():
	GameState.msgWriter = msgWriter
	loadLevel()


func loadLevel():
	GameState.read_conversation(0)
	game_started = true


func _process(delta):
	if game_started and GameState.is_conversation_over():
		get_tree().change_scene_to_file("res://scenes/levels/open_eyes.tscn")
