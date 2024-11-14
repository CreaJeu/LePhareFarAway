extends Node2D
@onready var valve: Sprite2D = $Valve
@onready var handle: Node2D = $Valve/Handle
@onready var progress_bar: ProgressBar = $ProgressBar

var is_grabbing_handle = false  # Track if the handle is held
var last_angle_to_mouse = 0  
var activation_radius = 30  # Distance threshold for activating the handle
var score: int = 0
var rotation_threshold : float = 2 * PI  # The angle for one full rotation (in radians)
var scene_change_threshold = 100  # Score threshold to change scene (can be adjusted)

func _ready():
	# Initialize progress bar
	progress_bar.value = 0  # Start with an empty progress bar

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Check if the mouse is near the handle when the button is first pressed.
			var mouse_pos = get_global_mouse_position()
			if handle.global_position.distance_to(mouse_pos) <= activation_radius:
				is_grabbing_handle = true  # Start rotating
				last_angle_to_mouse = valve.global_position.angle_to_point(mouse_pos)
				GameState.emit_signal("play_sound", "Valve")
		else:
			# Stop rotation when the mouse button is released.
			is_grabbing_handle = false
			GameState.emit_signal("stop_sound", "Valve")

func _process(delta):
	if is_grabbing_handle:
		# Get the current mouse position and calculate the angle relative to the valve's center
		var mouse_pos = get_global_mouse_position()
		var valve_center = valve.global_position
		var current_angle_to_mouse = valve_center.angle_to_point(mouse_pos)
		valve.rotation += angle_difference(last_angle_to_mouse,current_angle_to_mouse)
		

		# Check if a full rotation has been completed
		if abs(valve.rotation) >= rotation_threshold:
			score += 5  # Increment the score based on the number of rotations

			# Calculate the progress bar value (convert score to float for accurate calculation)
			var progress_bar_value = float(score) / float(scene_change_threshold) * float(progress_bar.max_value)

			progress_bar.value = clamp(progress_bar_value, 0.0, float(progress_bar.max_value))


			# Reset valve rotation to avoid overflow (keep it within -PI to PI range)
			valve.rotation = wrapf(valve.rotation, -PI, PI)

			# END OF THE GAME
			if score >= scene_change_threshold:
				get_tree().paused = false
				get_node("/root/Main/CanvasLayer").visible = true
				GameState.emit_signal("stop_sound", "Valve")
				self.queue_free()
				
		last_angle_to_mouse = current_angle_to_mouse
