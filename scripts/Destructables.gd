extends GridMap


# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_meshes())
	pass # Replace with function body.
	

func destroy_cell(collision_point):
	var scale_point = collision_point
	var NodeLocal = to_local(scale_point)
	var map_coordinate = local_to_map(NodeLocal)
	set_cell_item(map_coordinate, -1)

	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
