extends Camera3D

const SPEED := 10.0
const SENS := 0.2
@export var x := -45.0
@export var y := 90.0
var captured := true

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("toggle_capture"):
		if captured:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		captured = not captured
			
	
	var dir := Vector3()
	dir.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir = dir.normalized()
	global_translate(transform.basis * dir * SPEED * delta)
	
	if Input.is_action_pressed("rise"):
		position.y += 10 * delta
		
	
	var mouse = Input.get_last_mouse_velocity()
	x -= mouse.y * SENS * delta
	y -= mouse.x * SENS * delta
	rotation_degrees = Vector3(x, y, 0)
	x = clamp(x, -90, 90)
