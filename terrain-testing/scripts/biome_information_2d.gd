class_name BiomeInformation2D
extends Node

enum BiomeType2D {
	DEEP_OCEAN,
	SHALLOW_OCEAN,
	SAND,
	GRASS,
	ROCK,
	SNOW
}

const biome_tile_coords: Dictionary[BiomeType2D, Vector2]= {
	BiomeType2D.DEEP_OCEAN: Vector2(0, 0),
	BiomeType2D.SHALLOW_OCEAN: Vector2(1, 0),
	BiomeType2D.SAND: Vector2(2, 0),
	BiomeType2D.GRASS: Vector2(3, 0),
	BiomeType2D.ROCK: Vector2(4, 0),
	BiomeType2D.SNOW: Vector2(5, 0)
}
	

func determine_biome_type(height: float) -> BiomeType2D:
	if height <= 0.1:
		return BiomeType2D.DEEP_OCEAN
	elif height <= 0.15:
		return BiomeType2D.SHALLOW_OCEAN
	elif height <= 0.3:
		return BiomeType2D.SAND
	elif height <= 0.65:
		return BiomeType2D.GRASS
	elif height <= 0.9:
		return BiomeType2D.ROCK
	else:
		return BiomeType2D.SNOW
	
