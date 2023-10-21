extends Button

@onready var anim = $"../../Control/ColorRect/AnimationPlayer"
func _on_pressed():
	$click_sound.play()
	$"../../Control/ColorRect".visible = true
	anim.play("fade")
	await  anim.animation_finished
	
	get_tree().change_scene_to_file("res://game.tscn")
	
