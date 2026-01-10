extends MultiMeshInstance3D

@export var WIDTH := 100
@export var LENGTH := 100
@export var MAX_HEIGHT := 100
@export var WATER_HEIGHT := 0.15
var elevation_gen: elevation_generation
var moisture_gen: moisture_generation
var biome_info : biome_information
var cnt := 0
@onready var mesh: Mesh = multimesh.mesh
@onready var camera: Camera3D = $"../Camera3D"


func _ready() -> void:
	multimesh.instance_count = WIDTH * LENGTH * MAX_HEIGHT
	elevation_gen = elevation_generation.new()
	moisture_gen = moisture_generation.new()
	biome_info = biome_information.new()
	var elevation_map := elevation_gen.gen_elevation(WIDTH, LENGTH)
	var moisture_map := moisture_gen.gen_moisture(WIDTH, LENGTH)
	gen_terrain(elevation_map, moisture_map)
	
	
	


func _process(delta: float) -> void:
	pass
	
func gen_terrain(elevation_map: Array[PackedFloat32Array], moisture_map: Array[PackedFloat32Array]) -> void:
	for y_int in range(MAX_HEIGHT): 
		var y := float(y_int) / 100.0
		for x in range(elevation_map.size()):
			for z in range(elevation_map[x].size()):
				if elevation_map[x][z] >= y:
					cnt += 1
					set_instance_position(x,y_int,z)
					set_instance_colour(y, moisture_map[x][y])
				elif y < WATER_HEIGHT:
					cnt += 1
					set_instance_position(x,y_int,z)
					set_instance_colour(y, moisture_map[x][y])

# Inserts cube into multimesh			
func set_instance_position(x: int, y: int, z: int) -> void:
	var pos = Vector3(x, y, z)
	var transform := Transform3D(Basis(), pos)
	multimesh.set_instance_transform(cnt, transform)

# Determines colour of cube
func set_instance_colour(height: float, moisture: float) -> void:
	var biome := biome_info.determine_biome_type(height, moisture, WATER_HEIGHT)
	var colour := biome_info.biome_colours[biome]
	multimesh.set_instance_color(cnt, colour)
	
	
	
