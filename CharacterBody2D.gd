extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -750.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = $CollisionShape2D/AnimatedSprite2D
var is_running = false
var is_jumping = false
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

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		is_running = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		is_running = false
	if direction < 0:
		anim.set_flip_h(true)
	elif direction > 0:
		anim.set_flip_h(false)
	move_and_slide()
	if is_jumping:
		anim.play("jump")
	elif is_running:
		anim.play("run")

