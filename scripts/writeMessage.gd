extends RichTextLabel

var max_chars: int = 150
var words: PackedStringArray = []
var current_word: int = 0

func write(msg: String):
	words = msg.split(" ")
	write_line()

func write_line():
	if current_word >= len(words):
		words = []
		text = ""
		$ReadMoreButton.activate(false)
	else:
		$ReadMoreButton.activate(true)
		var line: String = ""
		while current_word < len(words):
			if len(line) + len(words[current_word]) + 1 < max_chars:
				line += words[current_word] + " "
				current_word += 1
			else:
				break
			
		text = line

func _process(delta):
	if len(words) > 0 and Input.is_action_just_pressed("interact"):
		write_line()
