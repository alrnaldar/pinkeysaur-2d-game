extends Popup

@onready var message_label = $Label

func set_message(message: String):
	message_label.text = message

func _on_close_button_pressed():
	hide()
