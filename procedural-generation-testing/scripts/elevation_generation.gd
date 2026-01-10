class_name elevation_generation
extends Node


var _elevation_map: Array[PackedFloat32Array]
var _noise_gen : FastNoiseLite

func _init() -> void:
	_noise_gen = FastNoiseLite.new()
	_noise_gen.noise_type = FastNoiseLite.TYPE_PERLIN
	

# Clear and resizes elevation map in preperation of use
func size_map(width: int, height: int) -> void:
	_elevation_map.resize(height)
	for arr in _elevation_map:
		arr = PackedFloat32Array()
		arr.clear()
		arr.resize(width)
		

# Generates an elevation map for tghe desired width and height
func gen_elevation(width: int, height: int) -> Array[PackedFloat32Array]:
	size_map(width, height)
	for x in range(width):
		for y in range(height):
			_elevation_map[x][y] = _noise_gen.get_noise_2d(x, y)
	print(_elevation_map)
	return _elevation_map
	

	
	
	
