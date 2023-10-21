extends ParallaxBackground


var speed = 300
func _process(delta):
	scroll_offset.x -= speed * delta
	
