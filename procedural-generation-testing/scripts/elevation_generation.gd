class_name elevation_generation
extends Node


var _elevation_map: Array[PackedFloat32Array]
var _noise_gen: FastNoiseLite

func _init() -> void:
	_noise_gen = FastNoiseLite.new()
	_noise_gen.noise_type = FastNoiseLite.TYPE_PERLIN
	_noise_gen.seed = randi()
	_noise_gen.fractal_octaves = 3
	_noise_gen.frequency = 0.02
	

# Clear and resizes elevation map in preperation of use
func size_map(width: int, length: int) -> void:
	_elevation_map.resize(length)
	for i in range(_elevation_map.size()):
		_elevation_map[i] = PackedFloat32Array()
		_elevation_map[i].resize(width)
		
		

# Generates an elevation map for the desired width and length
func gen_elevation(width: int, length: int) -> Array[PackedFloat32Array]:
	size_map(width, length)
	for x in range(length):
		for y in range(width):
			var height = _noise_gen.get_noise_2d(x, y)
			height = (height + 1.0) * 0.5
			height = pow(height, 1.2)
			height = snapped(height , 0.01)
			_elevation_map[x][y] = height
	return _elevation_map
	

	
	
	
