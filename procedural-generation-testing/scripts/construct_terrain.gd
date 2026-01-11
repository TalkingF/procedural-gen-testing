extends MultiMeshInstance3D

@export var WIDTH := 100
@export var LENGTH := 100
@export var MAX_HEIGHT := 100
@export var WATER_HEIGHT := 0.15
@export var elevation_gen: ElevationGeneration
var moisture_gen: moisture_generation
var biome_info : biome_information
var cnt := 0
@onready var mesh: Mesh = multimesh.mesh
@onready var camera: Camera3D = $"../Camera3D"


func _ready() -> void:
	multimesh.instance_count = WIDTH * LENGTH * MAX_HEIGHT
	moisture_gen = moisture_generation.new()
	biome_info = biome_information.new()
	var elevation_map := elevation_gen.gen_elevation(WIDTH, LENGTH)
	var moisture_map := moisture_gen.gen_moisture(WIDTH, LENGTH)
	gen_terrain(elevation_map, moisture_map)
	
	
func gen_terrain(elevation_map: Array[PackedFloat32Array], moisture_map: Array[PackedFloat32Array]) -> void:
	for x in range(elevation_map.size()):
		for z in range(elevation_map[x].size()):
			var y := elevation_map[x][z]
			var land_scale := int(y * 100.0)
			
			#land generation
			cnt += 1
			set_instance_position(x, land_scale ,z , 0)
			set_instance_colour(y, moisture_map[x][z], false)
			
			#water generation
			if y < WATER_HEIGHT:
				cnt += 1
				var water_scale:= (WATER_HEIGHT * 100.0) - land_scale
				set_instance_position(x, water_scale ,z, land_scale)
				set_instance_colour(y, moisture_map[x][z], true)
			

# Inserts cube into multimesh, y is how tall it is and offset is where it starts			
func set_instance_position(x: int, y: int, z: int, height_offset: int) -> void:
	var pos = Vector3(x, (y / 2.0) + height_offset, z)
	var basis := Basis().scaled(Vector3(1, y, 1))
	var transform := Transform3D(basis, pos)
	multimesh.set_instance_transform(cnt, transform)
	

# Determines colour of cube
func set_instance_colour(height: float, moisture: float, is_water: bool) -> void:
	var biome := biome_info.determine_biome_type(height, moisture, WATER_HEIGHT, is_water)
	var colour := biome_info.biome_colours[biome]
	multimesh.set_instance_color(cnt, colour)
	
	
	
