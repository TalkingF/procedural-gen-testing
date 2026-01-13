extends Camera2D

var dragging := false
var mouse_pos := Vector2()


func _ready() -> void:
	pass



func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("mouse_click"):
		dragging = true
		mouse_pos = get_viewport().get_mouse_position()
	elif Input.is_action_just_released("mouse_click"):
		dragging = false
	elif dragging:
		var current_mouse_pos = get_viewport().get_mouse_position()
		var mouse_delta = current_mouse_pos - mouse_pos
		position -= mouse_delta / zoom
		mouse_pos = current_mouse_pos
	
		
func _unhandled_input(event):
	if event.is_action_pressed("mouse_wheel_up"):
		zoom += Vector2(0.1, 0.1)

	elif event.is_action_pressed("mouse_wheel_down"):
		zoom -= Vector2(0.1, 0.1)
		
		
