extends GridMap


# Called when the node enters the scene tree for the first time.
func _ready():
	#print_grid_contents()
	pass # Replace with function body.

#func print_grid_contents():
	#for x in range(0, 0.5):
		#for y in range(0, 0.25):
			#for z in range(0, 0.5):
				##var cell_item = get_cell_item(x, y, z)
				##if cell_item != -1:
					#print("Item at (", x, ", ", y, ", ", z, "): ", cell_item)

func destroy_cell(collision_point):
	var map_coordinate = local_to_map(collision_point)
	print("Collision point: ", collision_point)
	print("Map coordinate: ", map_coordinate)
	var existing_item = get_cell_item(map_coordinate)
	print("Existing item before destruction: ", existing_item)
	set_cell_item(map_coordinate, -1,-1)
	var check_item = get_cell_item(map_coordinate)
	print("Item after setting to -1: ", check_item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
