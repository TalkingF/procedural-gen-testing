extends Node
const _2D_GENERATION = preload("uid://cfdwnf4vp4swt")
const _3D_GENERATION = preload("uid://c1jo8n5x1qy2n")

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("switch_scene_2d"):
		get_tree().change_scene_to_packed(_2D_GENERATION)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif Input.is_action_just_pressed("switch_scene_3d"):
		get_tree().change_scene_to_packed(_3D_GENERATION)
	
