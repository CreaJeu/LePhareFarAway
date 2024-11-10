extends Node2D

var move: int = 1
var nb_blinks: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Rec_center.color.a = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Rec_haut.position.y -= move
	$Rec_bas.position.y  += move
	$Rec_center.color.a -= 0.002
	pass


func _on_timer_timeout():
	if nb_blinks != 2:
		move *= -2
		nb_blinks += 1
	else: 
		#$Rec_center.color.a -= 0.01
		get_tree().change_scene_to_file("res://scenes/levels/main.tscn")
