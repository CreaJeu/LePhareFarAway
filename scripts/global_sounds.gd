extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.connect("play_sound", play_sound)
	GameState.connect("stop_sound", stop_sound)


func play_sound(name: String) -> void:
	match name:
		"PickupKeys":
			$PickupKeys.play()
		"Valve":
			$Valve.play()
		_:
			pass

func stop_sound(name: String) -> void:
	match name:
		"Valve":
			$Valve.stop()
		_:
			pass
