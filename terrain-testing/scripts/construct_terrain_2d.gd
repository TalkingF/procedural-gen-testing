extends TileMapLayer

@export var WIDTH := 100
@export var LENGTH := 100
@export var elevation_gen: ElevationGeneration
var biome_info : BiomeInformation2D


@onready var camera: Camera2D = $"../Camera2D"


func _ready() -> void:
	var elevation_map := elevation_gen.gen_elevation(WIDTH, LENGTH)
	biome_info = BiomeInformation2D.new()
	gen_terrain(elevation_map)


func gen_terrain(elevation_map: Array[PackedFloat32Array]) -> void:
	
	for x in range(elevation_map.size()):
		for y in range(elevation_map[x].size()):
			var height := elevation_map[x][y]
			var biome := biome_info.determine_biome_type(height)
			var tile := biome_info.biome_tile_coords[biome]
			set_cell(Vector2(x, y), 0, tile)
	
	
