extends Node2D

@export var msgWriter: PanelContainer


func _ready():
	loadLevel()


func loadLevel():
	GameState.read_conversation(msgWriter, 0)
