extends Node

@export var mob_scene: PackedScene

func _ready():
	$UserInterface/Retry.hide()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		# This restarts the current scene.
		get_tree().reload_current_scene()


func _on_timer_timeout():
	print("Mob created")
	var mob = mob_scene.instantiate()
	$Path3D/PathFollow3D.progress_ratio = randf()
	mob.initialize($Path3D/PathFollow3D.position, $Player.position)
	add_child(mob)
	$UserInterface/ScoreLabel.on_mob_squashed()



func _on_player_hit():
	$Timer.stop()
	$UserInterface/Retry.show()
