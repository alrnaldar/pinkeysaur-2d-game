extends Node2D

var time_since_last_spawn = 0
var spawn_interval = 1
var score = 0
var enemies = []
var speed_modifier = 500
@onready var label = $Label
@onready var bg = $ParallaxBackground

@onready var anim_fade = $Control/ColorRect/AnimationPlayer
@onready var char = Globals.char 
@onready var player = char.instantiate()
@onready var anim = player.get_node("CollisionShape2D/AnimatedSprite2D")
func _ready():
	$Control/ColorRect.visible = true
	anim_fade.play_backwards("fade")
	await anim_fade.animation_finished
	$Control/ColorRect.visible = false
	
	player.position = Vector2(55,486)
	add_child(player)


func _process(delta):
	if Globals.game_ended == true:
		get_tree().paused = true
		end_game(score)
	bg.scroll_offset.x -= speed_modifier * delta
	time_since_last_spawn += delta
	score += 0.2
	label.text = "score:" + str(round(score))

	speed_modifier += 0.1
	if speed_modifier > 1000:
		spawn_interval = 0.840
		anim.speed_scale = 1.7 
	if time_since_last_spawn >= spawn_interval:
		var enemy = spawn_enemy()
		enemies.append(enemy)
		time_since_last_spawn = 0

	for enemy in enemies:
		enemy.position.x -= speed_modifier * delta
		if enemy.position.x < -50:
			enemy.queue_free()
			enemies.erase(enemy) 
func spawn_enemy():
	var enemy_packed = preload("res://poop_enemy.tscn")
	var enemy = enemy_packed.instantiate()
	enemy.position = Vector2(1094, 498)
	add_child(enemy)
	return enemy
func end_game(point):
	var highscore = load_record()
	if point > int(highscore):

		save_record(point)
	$Panel.visible = true
	$Panel/score_Label.text = "score:"+str(round(point))
	$Panel/highscore_Label.text = "record:"+highscore
	if int(highscore)<int(load_record()):
		$Panel/new_highscore_Label.visible = true
		$Panel/new_highscore_Label.text = "new record:"+load_record()
func save_record(content):
	var file = FileAccess.open("user://hs.save",FileAccess.WRITE)
	file.store_string(str(round(content)))
func load_record():
	if FileAccess.file_exists("user://hs.save"):
		var file = FileAccess.open("user://hs.save",FileAccess.READ)
		var record = file.get_as_text()
		#$Panel/highscore_Label.text = "рекорд:"+record
		return record
	else:
		print("нету нужного файла")



	
	
