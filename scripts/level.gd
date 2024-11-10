extends Node2D

@export var msgWriter: PanelContainer


func _ready():
	loadLevel()


func loadLevel():
	var start_dialog = null
	for dlg in GameState.dialogs:
		if dlg["id"] == 0:
			start_dialog = dlg
			break
	
	print("start dialog")
	print(GameState.dialogs)
	if start_dialog != null:
		msgWriter.write(start_dialog.text)
