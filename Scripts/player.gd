extends CharacterBody2D
@onready var anim = $AnimatedSprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -250.0
var GRAVITY = Vector2(0.0,980.0)

func _physics_process(delta: float) -> void:

	# Add the gravity when idle.
	if not is_on_floor() or not is_on_ceiling():
		velocity += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_ceiling()):
		if GRAVITY == Vector2(0.0,980.0):
			velocity.y = JUMP_VELOCITY
		else :
			velocity.y = -1*JUMP_VELOCITY

	# Gravity inversion
	if Input.is_action_just_pressed("invert"):
		GRAVITY *= -1

	# Sprite flipping on gravity inversion
	if GRAVITY == Vector2(0.0,980):
		anim.flip_v = false
	elif GRAVITY == Vector2(0.0,-980):
		anim.flip_v = true

	# Movement and facing in the moving direction
	var direction := Input.get_axis("left", "right")
	if (direction < 0 and GRAVITY == Vector2(0.0,980.0)) or (direction > 0 and GRAVITY == Vector2(0.0,-980.0)):
		anim.flip_h = true
	elif (direction > 0 and GRAVITY == Vector2(0.0,980.0)) or (direction < 0 and GRAVITY == Vector2(0.0,-980.0)):
		anim.flip_h = false

	# Movement Direction
	if direction and GRAVITY == Vector2(0.0,980.0):
		velocity.x = direction * SPEED
	elif direction and GRAVITY == Vector2(0.0,-980.0):
		velocity.x = -1 * direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
