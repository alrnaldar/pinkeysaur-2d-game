extends ColorRect

@onready var _anim_player := $AnimationPlayer

func _ready():
	_anim_player.play("fade")
	await _anim_player.animation_finished
	_anim_player.play_backwards("fade")
	await _anim_player.animation_finished
	get_tree().change_scene_to_file("res://game.tscn")
