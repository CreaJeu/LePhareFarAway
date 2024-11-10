extends Node

var dialogs: Array = []

var msgWriter: PanelContainer
var missionsPanelContainer: PanelContainer
var has_keys: bool = false
var has_barrel: bool = true
var is_gasoil_lamp_filled: bool = false
var missions: Array[String] = ["Allumer la radio", ""]
var all_missions: Array[String] = []

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


func is_conversation_over() -> bool:
	return len(msgWriter.words) == 0


func updateMissionsPanelContainer():
	missionsPanelContainer.get_node("RichTextLabel").text = "Mission 1 : %s\nMission 2 : %s" % missions
