extends Node2D

@export var msgWriter: PanelContainer
@export var missionsPanelContainer: PanelContainer


func _ready():
	GameState.msgWriter = msgWriter
	GameState.missionsPanelContainer = missionsPanelContainer
	
	loadLevel()


func loadLevel():
	GameState.updateMissionsPanelContainer()
