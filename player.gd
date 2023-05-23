extends CharacterBody3D

signal hit

@export var speed = 3000
@export var target_velocity = Vector3.ZERO

func _physics_process(delta):
	target_velocity = Vector3.ZERO
	if (Input.is_action_pressed("move_forward")):
		target_velocity += Vector3(0,0,-1)
	
	if (Input.is_action_pressed("move_backwards")):
		target_velocity += Vector3(0,0,1)
		
	if (Input.is_action_pressed("move_left")):
		target_velocity += Vector3(-1,0,0)
		
	if (Input.is_action_pressed("move_right")):
		target_velocity += Vector3(1,0,0)
		
	target_velocity = target_velocity.normalized()
	$Pivot.look_at(position + target_velocity, Vector3.UP)
	
	velocity = target_velocity * speed * delta
	
	
	move_and_slide()
	


func _on_area_3d_body_entered(body):
	hit.emit()
	print(position)
	print(body.position)
	queue_free()
	print("Ahhhhhh")
