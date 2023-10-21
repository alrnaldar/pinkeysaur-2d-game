extends Button



func _on_pressed():
	$click_sound.play()
	Globals.char = preload("res://pinkey.tscn")
