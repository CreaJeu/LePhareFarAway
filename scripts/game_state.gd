extends Node

var dialogs = []

func _ready():
	var dialogsString: String = FileAccess.get_file_as_string("res://resources/data/dialogs.json")
	dialogs = JSON.new().parse(dialogsString)
