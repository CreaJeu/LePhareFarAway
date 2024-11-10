extends Node

var dialogs: Array = []

var has_baril: bool = false
var msgWriter: PanelContainer
var has_keys: bool = false

signal pause_game
signal play_sound(name: String)

func _ready():
	var file: FileAccess = FileAccess.open("res://resources/data/dialogs.json", FileAccess.READ)

	if file:
		var content: String = file.get_as_text()
		file.close()
		dialogs = JSON.parse_string(content)
		
	
		

func read_conversation(id: int):
	pause_game.emit()
	get_tree().paused = true
	var conversation = 0
	for dlg in GameState.dialogs:
		if dlg["id"] == id:
			conversation = dlg["conversation"]
	
	if conversation != null:
		msgWriter.write_conversation(conversation)
	
