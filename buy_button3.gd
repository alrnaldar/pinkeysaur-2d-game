extends Button


func _on_pressed():
	$click_sound.play()
	if int(get_record()) >= 2000:
		Globals.char = preload("res://dude.tscn")
	else:
		var message_popup = preload("res://shoppopup.tscn")
		var message_instance = message_popup.instantiate()
		add_child(message_instance)
		message_instance.set_message("your record is still too low, set a new record")  # Установите текст сообщения
		message_instance.popup_centered()


func get_record():
	if FileAccess.file_exists("user://hs.save"):
		var file = FileAccess.open("user://hs.save",FileAccess.READ)
		var record = file.get_as_text()
		return record
