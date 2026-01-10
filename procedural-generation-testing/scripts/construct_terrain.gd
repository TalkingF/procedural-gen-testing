extends MultiMeshInstance3D

const WIDTH := 100
const LENGTH := 100
const MAX_HEIGHT := 100
var elevation_gen: elevation_generation
var cnt := 0
@onready var mesh: Mesh = multimesh.mesh
@onready var camera: Camera3D = $"../Camera3D"


func _ready() -> void:
	multimesh.instance_count = WIDTH * LENGTH * MAX_HEIGHT
	elevation_gen = elevation_generation.new()
	var elevation_map := elevation_gen.gen_elevation(WIDTH, LENGTH)
	gen_terrain(elevation_map)
	
	


func _process(delta: float) -> void:
	pass
	
func gen_terrain(elevation_map: Array[PackedFloat32Array]) -> void:
	for y_int in range(MAX_HEIGHT): 
		var y := float(y_int) / 100.0
		for x in range(elevation_map.size()):
			for z in range(elevation_map[x].size()):
				if elevation_map[x][z] >= y:
					cnt += 1
					set_instance_position(x,y_int,z)
					
				
func set_instance_position(x: int, y: int, z: int) -> void:
	var pos = Vector3(x, y, z)
	var transform := Transform3D(Basis(), pos)
	multimesh.set_instance_transform(cnt, transform)
	multimesh.set_instance_color(cnt, Color.ANTIQUE_WHITE)
	if y > 10:
		multimesh.set_instance_color(cnt, Color.AQUA)
	if y > 20:
		multimesh.set_instance_color(cnt, Color.YELLOW)
	if y > 30:
		multimesh.set_instance_color(cnt, Color.GREEN_YELLOW)
	if y > 40:
		multimesh.set_instance_color(cnt, Color.CORAL)
	if y > 50:
		multimesh.set_instance_color(cnt, Color.RED)
	if y > 60:
		multimesh.set_instance_color(cnt, Color.MEDIUM_VIOLET_RED)
	if y > 70:
		multimesh.set_instance_color(cnt, Color.PURPLE)
	if y > 80:
		multimesh.set_instance_color(cnt, Color.PINK)
	if y > 90:
		multimesh.set_instance_color(cnt, Color.DIM_GRAY)
	if y > 95:
		multimesh.set_instance_color(cnt, Color.BLACK)
	
