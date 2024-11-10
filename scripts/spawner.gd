extends Node2D

@export var food = preload("res://scenes/prefabs/food_bean.tscn")

func _ready() -> void:
	var foodd = food.instantiate()
	add_child(foodd)
	foodd.position.x = randf_range(0,1100)
