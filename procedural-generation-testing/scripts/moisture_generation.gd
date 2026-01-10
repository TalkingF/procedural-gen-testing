class_name moisture_generation
extends Node

var _moisture_map: Array[PackedFloat32Array]
var _noise_gen: FastNoiseLite

func _init() -> void:
	_noise_gen = FastNoiseLite.new()
	_noise_gen.noise_type = FastNoiseLite.TYPE_PERLIN
	_noise_gen.fractal_type = FastNoiseLite.FRACTAL_NONE
	_noise_gen.frequency = 0.01
	
# Clear and resizes moisture map in preperation of use
func size_map(width: int, length: int) -> void:
	_moisture_map.resize(length)
	for i in range(_moisture_map.size()):
		_moisture_map[i] = PackedFloat32Array()
		_moisture_map[i].resize(width)
		
# Generates an moisture map for the desired width and length
func gen_moisture(width: int, length: int) -> Array[PackedFloat32Array]:
	size_map(width, length)
	for x in range(length):
		for y in range(width):
			var height = _noise_gen.get_noise_2d(x, y)
			height = (height + 1.0) * 0.5
			_moisture_map[x][y] = height
	return _moisture_map
