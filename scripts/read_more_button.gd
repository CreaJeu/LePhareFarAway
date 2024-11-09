extends TextureRect

@export var activated: bool = false
var time_till_visible: float = 0
var time_till_hidden: float = 0
var blink_time: float = 0.5


func activate(act: bool):
	activated = act
	if not activated:
		visible = false
	

func _process(delta):
	if activated:
		if visible:
			if time_till_hidden < blink_time:
				time_till_hidden += delta
			else:
				time_till_hidden = 0
				time_till_visible = 0
				visible = false
		else:
			if time_till_visible < blink_time:
				time_till_visible += delta
			else:
				time_till_hidden = 0
				time_till_visible = 0
				visible = true
