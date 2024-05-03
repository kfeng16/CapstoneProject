extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

var SPEED = 3
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	
	
	velocity = new_velocity
	move_and_slide()

func update_target_location(target_location):
	nav_agent.set_target_position(target_location)
	print(target_location, position)
	if(position - target_location <= Vector3(0.3,1,0.3)):
		$"."/Barbarian/AnimationPlayer.play("2H_Melee_Attack_Spinning")
	
