extends PanelContainer

var max_chars: int = 150
var words: PackedStringArray = []
var current_word: int = 0
var current_conv_dialog: int = 0
var conversation: Array = []

func write(msg: String):
	current_word = 0
	words = msg.split(" ")
	write_line()


func write_dialog_line():
	if current_conv_dialog < len(conversation):
		var dlg = conversation[current_conv_dialog]
		write(dlg["nom"] + " : " + dlg["text"])
		if dlg["nom"] == "Gwenaël":
			$RadioStatic.play()
		else:
			$RadioStatic.stop()
	else:
		visible = false
		get_tree().paused = false
		$RadioStatic.stop()


func write_conversation(conv: Array):
	current_conv_dialog = 0
	conversation = conv
	write_dialog_line()

func write_line():
	if current_word >= len(words):
		words = []
		$MarginContainer/RichTextLabel.text = ""
		$MarginContainer/RichTextLabel/ReadMoreButton.activate(false)
		current_conv_dialog += 1
		write_dialog_line()
	else:
		$MarginContainer/RichTextLabel/ReadMoreButton.activate(true)
		var line: String = ""
		while current_word < len(words):
			if len(line) + len(words[current_word]) + 1 < max_chars:
				line += words[current_word] + " "
				current_word += 1
			else:
				break
		
		visible = true
		$MarginContainer/RichTextLabel.text = line

func _process(delta):
	if len(words) > 0 and Input.is_action_just_pressed("read"):
		write_line()
