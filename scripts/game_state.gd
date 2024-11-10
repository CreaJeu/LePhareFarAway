extends Node

var dialogs: Array = []

var has_baril: bool = false

func _ready():
	var file: FileAccess = FileAccess.open("res://resources/data/dialogs.json", FileAccess.READ)

	if file:
		var content: String = file.get_as_text()
		file.close()
		dialogs = JSON.parse_string(content)
		

func read_conversation(msgWriter: PanelContainer, id: int):
	var conversation = 0
	for dlg in GameState.dialogs:
		if dlg["id"] == id:
			conversation = dlg["conversation"]
	
	if conversation != null:
		msgWriter.write_conversation(conversation)
