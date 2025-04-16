extends CharacterBody2D


var SPEED = 200.0
#const JUMP_VELOCITY = -400.0

@onready var target=$"../Player"
func _physics_process(delta: float) -> void:
	var direction=(target.position-position).normalized()
	velocity=direction*SPEED
	look_at(target.position)
	move_and_slide()



	move_and_slide()
