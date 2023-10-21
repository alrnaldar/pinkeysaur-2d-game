extends ItemList

func _process(delta):
	if Globals.char == preload("res://pinkey.tscn"):
		$PinkMonster2/buy_button.text = "selected"
	else: 
		$PinkMonster2/buy_button.text = "select"
	if Globals.char == preload("res://owlet.tscn"):
		$OwletMonster/buy_button2.text = "selected"
	else: 
		$OwletMonster/buy_button2.text = "select"
	if Globals.char == preload("res://dude.tscn"):
		$DudeMonster/buy_button3.text = "selected"
	else: 
		$DudeMonster/buy_button3.text = "select"
