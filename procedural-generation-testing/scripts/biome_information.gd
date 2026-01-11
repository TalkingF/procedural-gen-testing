class_name biome_information
extends Node

enum BiomeType {
	DESERT,
	SNOW,
	PLAINS,
	SHRUBLAND,
	SAVANNA,
	TUNDRA,
	RAINFOREST,
	BARE,
	WATER,
	DECIDUOUS_FOREST,
	TEMPERATE_DESERT
}

const biome_colours: Dictionary[BiomeType, Color]= {
	BiomeType.DESERT: Color.BURLYWOOD, 
	BiomeType.SNOW: Color.ALICE_BLUE, 
	BiomeType.PLAINS: Color.LIME_GREEN,
	BiomeType.SHRUBLAND: Color.OLIVE, 
	BiomeType.SAVANNA: Color.ORANGE,
	BiomeType.TUNDRA: Color.INDIAN_RED, 
	BiomeType.RAINFOREST: Color.DARK_GREEN,
	BiomeType.BARE: Color.DIM_GRAY, 
	BiomeType.WATER: Color.BLUE,
	BiomeType.DECIDUOUS_FOREST: Color.GOLDENROD,
	BiomeType.TEMPERATE_DESERT: Color.ORANGE_RED
	}

func determine_biome_type(height: float, moisture: float, water_level: float, water_pass: bool) -> BiomeType:
	if height <= water_level and water_pass:
		return BiomeType.WATER
		
	elif height >= 0.9: 
		return BiomeType.SNOW
		
	elif height >= 0.8:
		if moisture > 0.5:
			return BiomeType.TUNDRA
		return BiomeType.BARE
		
		
	elif height >= 0.6:
		if moisture < 0.35:
			return BiomeType.DESERT
		return BiomeType.SHRUBLAND
	
	elif height >= 0.35:
		if moisture > 0.65:
			return BiomeType.RAINFOREST
		if moisture > 0.4:
			return BiomeType.DECIDUOUS_FOREST
		if moisture > 0.3: 
			return BiomeType.PLAINS
			
		return BiomeType.SAVANNA
		
		
	else:
		if moisture < 0.2: 
			return BiomeType.TEMPERATE_DESERT
		if moisture < 0.3:
			return BiomeType.SAVANNA
		return BiomeType.PLAINS
