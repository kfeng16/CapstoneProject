extends Node3D

const SPEED = 10.0

@onready var mesh = $MeshInstance3D
@onready var ray = $RayCast3D
@onready var particle = $GPUParticles3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	position += transform.basis * Vector3(0,0,-SPEED) * delta
	if ray.is_colliding():
		mesh.visible = false
		particle.emitting = true
		await get_tree().create_timer(1.0).timeout
		queue_free()



func _on_timer_timeout():
	queue_free()
