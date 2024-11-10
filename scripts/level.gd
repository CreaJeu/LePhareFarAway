extends Node2D

@export var msgWriter: PanelContainer


func _ready():
	GameState.msgWriter = msgWriter
	
	loadLevel()


func loadLevel():
	GameState.read_conversation(0)
