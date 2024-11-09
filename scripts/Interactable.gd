extends Node2D

var playerInZone: bool = false


func _process(delta):
	if Input.is_action_just_pressed("interact") and playerInZone:
		# TODO: do item action
		print("Do interactable action")
		$"..".do_action()


func _on_area_2d_body_entered(body):
	print("Entered interactable zone")
	playerInZone = true


func _on_area_2d_body_exited(body):
	print("Exited interactable zone")
	playerInZone = false
