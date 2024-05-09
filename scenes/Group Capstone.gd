extends Node3D

@onready var player = $Player

func _physics_process(delta):
	get_tree().call_group("enemies", "update_target_location", player.global_transform.origin)


func _on_area_3d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	get_tree().change_scene_to_file("res://scenes/Win Screen.tscn")


func _on_area_3d_body_entered(body):
	get_tree().change_scene_to_file('res://scenes/Win Screen.tscn')
