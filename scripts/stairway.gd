extends Node2D

@export var player: CharacterBody2D
@export var step = -750

func do_action():
	player.position.y += step
