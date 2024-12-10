extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interactable_interactable_used(interaction_name):
	
	var pathToNoteScene : String = "res://scenes/prefabs/Notes/note"
	var toConcat: String = str(self.name)[-1] + ".tscn"
	var sceneNote1 = load(pathToNoteScene + toConcat)
	
	var instanceValve: Node2D = sceneNote1.instantiate()
	var root : Node2D = get_tree().get_current_scene()

	root.add_child(instanceValve)
	instanceValve.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	# find the good position to place the note on the screen
	var playerCamera: Camera2D  = get_node("/root/Main/Camera2D")
	var half_viewport : Vector2 = get_viewport().size / 2
	var left_corner_position : Vector2 = playerCamera.get_screen_center_position() - half_viewport * playerCamera.zoom
	
	instanceValve.z_index = 6 #for unknown reason doesn't go in front of the book top right corner
	$"/root/Main/CanvasLayer".visible = false
	instanceValve.position = left_corner_position
	GameState.emit_signal("play_sound", "PickupPaper")

	get_tree().paused = true

	
