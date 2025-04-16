extends Area2D

func diamond_collected(body: Node2D) -> void:
		Global.diamondcount += 1
		print(Global.diamondcount)
		queue_free()
