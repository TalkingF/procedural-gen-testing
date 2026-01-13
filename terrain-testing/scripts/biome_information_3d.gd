class_name BiomeInformation3D
extends Node

enum BiomeType3D {
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

const biome_colours: Dictionary[BiomeType3D, Color]= {
	BiomeType3D.DESERT: Color.BURLYWOOD, 
	BiomeType3D.SNOW: Color.ALICE_BLUE, 
	BiomeType3D.PLAINS: Color.LIME_GREEN,
	BiomeType3D.SHRUBLAND: Color.OLIVE, 
	BiomeType3D.SAVANNA: Color.ORANGE,
	BiomeType3D.TUNDRA: Color.INDIAN_RED, 
	BiomeType3D.RAINFOREST: Color.DARK_GREEN,
	BiomeType3D.BARE: Color.DIM_GRAY, 
	BiomeType3D.WATER: Color.BLUE,
	BiomeType3D.DECIDUOUS_FOREST: Color.GOLDENROD,
	BiomeType3D.TEMPERATE_DESERT: Color.ORANGE_RED
	}

func determine_biome_type(height: float, moisture: float, water_level: float, water_pass: bool) -> BiomeType3D:
	if height <= water_level and water_pass:
		return BiomeType3D.WATER
		
	elif height >= 0.9: 
		return BiomeType3D.SNOW
		
	elif height >= 0.8:
		if moisture > 0.5:
			return BiomeType3D.TUNDRA
		return BiomeType3D.BARE
		
		
	elif height >= 0.6:
		if moisture < 0.35:
			return BiomeType3D.DESERT
		return BiomeType3D.SHRUBLAND
	
	elif height >= 0.35:
		if moisture > 0.65:
			return BiomeType3D.RAINFOREST
		if moisture > 0.4:
			return BiomeType3D.DECIDUOUS_FOREST
		if moisture > 0.3: 
			return BiomeType3D.PLAINS
			
		return BiomeType3D.SAVANNA
		
		
	else:
		if moisture < 0.2: 
			return BiomeType3D.TEMPERATE_DESERT
		if moisture < 0.3:
			return BiomeType3D.SAVANNA
		return BiomeType3D.PLAINS
