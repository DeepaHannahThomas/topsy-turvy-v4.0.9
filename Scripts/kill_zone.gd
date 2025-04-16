extends Area2D
@onready var timer: Timer = $Timer
@onready var p = $"../Player"

func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	Global.diamondcount = 0

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_node("../GameOver").game_over()
	#p.velocity = Vector2(0.0,180.0)
