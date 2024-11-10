extends TextureButton

var original_scale: Vector2
var journal_display: Control

func _ready() -> void:
	original_scale = self.scale
	journal_display = get_node("../Carnet")
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	connect("pressed", _on_pressed)

func _on_mouse_entered() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS) # To keep playing when paused
	tween.tween_property(self, "scale", original_scale + Vector2(0.1, 0.1), 0.1) # Grow image scale in 0.1 seconds
 
func _on_mouse_exited() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS) # To keep playing when paused
	tween.tween_property(self, "scale", original_scale, 0.1) # go back to original scale in 0.1 seconds


func _process(delta: float) -> void: # Doing it in process is not ideal
	if Input.is_action_just_released("open"):
		if journal_display.visible == true:
			journal_display.visible = false
		else:
			journal_display.visible = true

func _on_pressed() -> void:
	if journal_display.visible == true:
		journal_display.visible = false
	else:
		journal_display.visible = true
