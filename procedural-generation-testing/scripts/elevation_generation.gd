class_name elevation_generation
extends Node


var _elevation_map: Array[PackedFloat32Array]
var _noise_gen: FastNoiseLite

func _init() -> void:
	_noise_gen = FastNoiseLite.new()
	_noise_gen.noise_type = FastNoiseLite.TYPE_PERLIN
	

# Clear and resizes elevation map in preperation of use
func size_map(width: int, length: int) -> void:
	_elevation_map.resize(length)
	for i in range(_elevation_map.size()):
		_elevation_map[i] = PackedFloat32Array()
		_elevation_map[i].resize(width)
		
		

# Generates an elevation map for the desired width and length
func gen_elevation(width: int, length: int) -> Array[PackedFloat32Array]:
	size_map(width, length)
	for x in range(width):
		for y in range(length):
			_elevation_map[x][y] = snapped(abs(_noise_gen.get_noise_2d(x, y)), 0.01)
	return _elevation_map
	

	
	
	
