extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interactable_interactable_used(interaction_name):
	var sceneNote1 = load("res://scenes/prefabs/notes/note1.tscn")
	var instanceNote1: Node2D = sceneNote1.instantiate()
	var root : Node2D = get_tree().get_current_scene()

	root.add_child(instanceNote1)
	instanceNote1.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	# find the good position to place the note on the screen
	var playerCamera: Camera2D  = get_node("/root/Main/Camera2D")
	var half_viewport : Vector2 = get_viewport().size / 2
	var left_corner_position : Vector2 = playerCamera.get_screen_center_position() - half_viewport * playerCamera.zoom
	
	#instanceNote1.z_as_relative = false
	instanceNote1.z_index = 6 #for unknown reason doesn't go in front of the book top right corner
	$"/root/Main/CanvasLayer".visible = false
	instanceNote1.position = left_corner_position
	get_tree().paused = true
	
