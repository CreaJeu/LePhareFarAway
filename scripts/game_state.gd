extends Node

var dialogs = []

func _ready():
	var file = FileAccess.open("res://resources/data/dialogs.json", FileAccess.READ)

	if file:
		var content = file.get_as_text()
		file.close()
		dialogs = JSON.parse_string(content)
		print(dialogs)
