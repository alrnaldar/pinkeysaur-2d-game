extends Button


func _on_pressed():
	$"..".visible = false
	$"../../Panel".visible = true
