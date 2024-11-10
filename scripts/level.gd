extends Node2D

@export var msgWriter: PanelContainer
@export var missionsPanelContainer: PanelContainer


func _ready():
	GameState.msgWriter = msgWriter
	GameState.missionsPanelContainer = missionsPanelContainer
	
	loadLevel()


func loadLevel():
	GameState.add_mission(1)
	GameState.add_mission(2)
	GameState.add_mission(3)
