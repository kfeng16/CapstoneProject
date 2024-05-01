extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var spell = load("res://spell_trail.tscn")
var instance

@onready var wand = $RayCast3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	handle_jump(delta)
	handle_spell_cast()
	handle_movement(delta)
	move_and_slide()

func handle_jump(delta):
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		play_animation("Jump_Full_Long")
	
func handle_spell_cast():
	if Input.is_action_just_pressed("Press C"):
		shoot()

func handle_movement(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)).normalized()
	
	if direction.length() != 0:
		# If there's input, set the velocity based on the direction.
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		play_animation("Running_B")
	else:
		# Decelerate to zero if there is no input.
		velocity.x = lerp(velocity.x, 0.0, 10.0 * delta)  # Ensure all numbers are floats
		velocity.z = lerp(velocity.z, 0.0, 10.0 * delta)
		if is_on_floor() and $Mage/AnimationPlayer.current_animation != "Idle":
			play_animation("Idle")
	
func play_animation(name, interruptible=false):
	if interruptible or $Mage/AnimationPlayer.current_animation == "Idle":
		$Mage/AnimationPlayer.stop()
		$Mage/AnimationPlayer.play(name)

func shoot():
	play_animation("Spellcast_Shoot", true) 
	instance = spell.instantiate()
	instance.position = wand.global_position
	instance.transform.basis = wand.global_transform.basis
	get_tree().get_root().add_child(instance)
	
