extends CharacterBody3D

@export var minSpeed = 500
@export var maxSpeed = 2000

#var start_position = velocity * random

var target_velocity = Vector3.ZERO
var init_speed = 0

func initialize(start_position, player_position):
	look_at_from_position(start_position, player_position)
	rotate_y(randf_range(-PI / 4, PI / 4))
	init_speed = randi_range(minSpeed, maxSpeed)
	target_velocity = Vector3.FORWARD
	target_velocity = target_velocity.rotated(Vector3.UP, rotation.y)


func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()

func _physics_process(delta): 
	velocity = target_velocity * delta * init_speed
	move_and_slide()
