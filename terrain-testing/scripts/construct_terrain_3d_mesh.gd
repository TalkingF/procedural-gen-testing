extends MeshInstance3D

@export var WIDTH := 100
@export var LENGTH := 100
@export var MAX_HEIGHT := 100
@export var elevation_gen: ElevationGeneration
var moisture_gen: MoistureGeneration
var biome_info: BiomeInformation3D
var st: SurfaceTool
const MESH_MATERIAL = preload("uid://dg5dcfir5fdv4")


@onready var camera: Camera3D = $"../Camera3D"


func _ready() -> void:
	moisture_gen = MoistureGeneration.new()
	biome_info = BiomeInformation3D.new()
	st = SurfaceTool.new()
	var elevation_map := elevation_gen.gen_elevation(WIDTH, LENGTH, false)
	var moisture_map := moisture_gen.gen_moisture(WIDTH, LENGTH)
	material_override = MESH_MATERIAL
	material_override.vertex_color_use_as_albedo = true
	gen_terrain(elevation_map, moisture_map)
	
	
func gen_terrain(elevation_map: Array[PackedFloat32Array], moisture_map: Array[PackedFloat32Array]) -> void:
	st.set_smooth_group(0)
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	
	for x in range(elevation_map.size() - 1):
		for z in range(elevation_map[x].size() - 1):
			var y := elevation_map[x][z]
			
			var h00 := elevation_map[x][z] * 100.0
			var h10 := elevation_map[x + 1][z] * 100.0
			var h01 := elevation_map[x][z + 1] * 100.0
			var h11 := elevation_map[x + 1][z + 1] * 100.0
			
			var v00 := Vector3(x, h00, z)
			var v10 := Vector3(x + 1, h10, z)
			var v01 := Vector3(x, h01, z + 1)
			var v11 := Vector3(x + 1, h11, z + 1)
			
			st.set_color(set_colour(h00))
			st.add_vertex(v00)
			st.set_color(set_colour(h10))
			st.add_vertex(v10)
			st.set_color(set_colour(h01))
			st.add_vertex(v01)
			
			st.set_color(set_colour(h10))
			st.add_vertex(v10)
			st.set_color(set_colour(h11))
			st.add_vertex(v11)
			st.set_color(set_colour(h01))
			st.add_vertex(v01)
			
	st.generate_normals()
	mesh = st.commit()
			
func set_colour(height: float) -> Color:
	height = height / 100.0

	if height < 0.3:
		return Color.BLUE.lerp(Color.GREEN, height / 0.3)
	elif height < 0.7:
		return Color.GREEN.lerp(Color.SADDLE_BROWN, (height - 0.3) / 0.4)
	else:
		return Color.SADDLE_BROWN.lerp(Color.WHITE, (height - 0.7) / 0.3)

	

	
	
	
