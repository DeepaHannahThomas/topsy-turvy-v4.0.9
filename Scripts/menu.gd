extends Control

func _on_Play_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_Exit_pressed() -> void:
	get_tree().quit()
