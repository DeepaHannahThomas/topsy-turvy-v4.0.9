extends Area2D
const FILE_BEGIN = "res://levels/level_"

func _ready() -> void:
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	if next_level_number == 4:
		$CanvasLayer/Label.modulate = Color.TRANSPARENT

func _on_body_entered(body):
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	
	if next_level_number == 4:
		if body.is_in_group("Player") and Global.diamondcount >= 4 :
			var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
			get_tree().change_scene_to_file(next_level_path)
		else:
			print("Collect all diamonds")
			$CanvasLayer/Label.modulate = Color.WHITE
			var tween = get_tree().create_tween()
			tween.tween_property($CanvasLayer/Label,"modulate:a",0.0,2)
	elif next_level_number == 6:
		get_tree().quit()
	else:
		if body.is_in_group("Player"):
			var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
			get_tree().change_scene_to_file(next_level_path)
