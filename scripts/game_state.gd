extends Node

var dialogs: Array = []

var msgWriter: PanelContainer
var missionsPanelContainer: PanelContainer
var has_keys: bool = false
var has_barrel: bool = true
var is_gasoil_lamp_filled: bool = false
var missions: Array = []
var all_missions: Array = []

signal pause_game
signal play_sound(name: String)

func _ready():
	var dialogs_file: FileAccess = FileAccess.open("res://resources/data/dialogs.json", FileAccess.READ)

	if dialogs_file:
		var content: String = dialogs_file.get_as_text()
		dialogs_file.close()
		dialogs = JSON.parse_string(content)
	
	var missions_file: FileAccess = FileAccess.open("res://resources/data/missions.json", FileAccess.READ)
	
	if missions_file:
		var content: String = missions_file.get_as_text()
		missions_file.close()
		all_missions = JSON.parse_string(content)


func get_mission_by_id(id: int):
	for m in all_missions:
		if m["id"] == id:
			return m

func add_mission(id: int):
	var mission = get_mission_by_id(id)
	missions.append(mission)
	updateMissionsPanelContainer()


func remove_mission(id: int):
	for i in range(len(missions)):
		if missions[i]["id"] == id:
			missions.remove_at(i)
			break
	updateMissionsPanelContainer()
	

func read_conversation(id: int):
	pause_game.emit()
	get_tree().paused = true
	var conversation = 0
	for dlg in dialogs:
		if dlg["id"] == id:
			conversation = dlg["conversation"]
	
	if conversation != null:
		msgWriter.write_conversation(conversation)


func is_conversation_over() -> bool:
	return len(msgWriter.words) == 0


func updateMissionsPanelContainer():
	var text_missions: String = ""
	if len(missions) > 0:
		text_missions = "Mission 1: %s" % missions[0]["mission"]
	if len(missions) > 1:
		text_missions += "\nMission 2: %s" % missions[1]["mission"]
	
	missionsPanelContainer.get_node("MarginContainer/RichTextLabel").text = text_missions
