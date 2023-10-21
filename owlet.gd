extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -750.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = $CollisionShape2D/AnimatedSprite2D

var is_jumping = false
var is_flipped = false  # Добавляем переменную для отслеживания состояния "flip_h"

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		#anim.stop( )
		velocity.y += (gravity*2) * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true

	else:
		is_jumping = false

	# Отслеживаем состояние клавиши "W" и устанавливаем "flip_h" соответственно
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		anim.play("run")
		is_flipped = direction < 0  # Если направление отрицательное, устанавливаем "is_flipped" в True
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("run")
		is_flipped = false  # Если нет направления, сбрасываем "is_flipped" в False
	
	# Устанавливаем "flip_h" на основе "is_flipped"
	anim.set_flip_h(is_flipped)

	move_and_slide()
	
	if is_jumping:
		$jump_sound.play()
		anim.play("jump")

