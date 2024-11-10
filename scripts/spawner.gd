extends Node2D

@export var bean = preload("res://scenes/prefabs/food_bean.tscn")
@export var cockroach = preload("res://scenes/prefabs/food_cockroach.tscn")

func _ready() -> void:
	pass


func _on_timer_timeout():
	var foodd: Node2D = null
	var rand_nf = randi() % 100
	if rand_nf < 50:
		foodd = bean.instantiate()
	else:
		foodd = cockroach.instantiate()	
	
	add_child(foodd)
	foodd.position.x = randf_range(0,1100)
