# How To Use

No export is currently available, so you will need to open the project in the Godot editor. After running the project, you can switch between the different demonstrations using the numbers on your keyboard.

## (1) 2D Generation

You can pan and zoom using your mouse. The generation represents a topographical map of a series of landmasses and water. You can modify the height and width of the generated terrain by changing the exported variables on the TileMapLayer in the editor. You can modify the distribution by changing the curve attached to the node.

![2D Generation](/repo-assets/2d_gen.png)

## (2) 3D Generation with Voxels

You can move around using WASD, look with your mouse and ascend using the space bar. You may need to move slightly depending on the settings youve set, as your camera may be in generated terrain. The colours of the terrain represent the biomes, which are picked using multiple noise maps. You can similarly change the size of the generated terrain as well as the water level by modifying the exported variables in the MultiMeshInstance3D.You can modify the distribution by changing the curve attached to the node.

![3D Generation](/repo-assets/3d_gen.png)

## (3) 3D Generation with Mesh

Uses the same navigation as the other 3D demonstration. Colour of the mesh is based of a lerp of its height.

![3D Generation](/repo-assets/3d_gen_mesh.png)
