extends Node3D

var SPEED = 10.0

@onready var mesh = $MeshInstance3D
@onready var ray = $RayCast3D
@onready var particle = $GPUParticles3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	position += transform.basis * Vector3(0,0,-SPEED) * delta
	ray.force_raycast_update()
	if ray.is_colliding():
		if ray.get_collider().is_in_group("enemies"):
			SPEED=0
			mesh.visible = false
			particle.emitting = true
			ray.get_collider().kill(ray.get_collision_point())
		if ray.get_collider().has_method("destroy_cell"):
			SPEED=0
			mesh.visible = false
			particle.emitting = true
			#print(ray.get_collision_point() - ray.get_collision_normal())
			ray.get_collider().destroy_cell(ray.get_collision_point() - ray.get_collision_normal())
		await get_tree().create_timer(1.0).timeout
		queue_free()



func _on_timer_timeout():
	queue_free()
