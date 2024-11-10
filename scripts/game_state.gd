extends Node

var dialogs: Array = []

func _ready():
	var file: FileAccess = FileAccess.open("res://resources/data/dialogs.json", FileAccess.READ)

	if file:
		var content: String = file.get_as_text()
		file.close()
		dialogs = JSON.parse_string(content)
		print(dialogs)
		
		