extends Button

export(String, FILE) var next_scene_path: = ""

func _get_configuration_warning():
	return "next_scene_path must be set" if next_scene_path == "" else ""

func _on_Play_pressed():
	get_tree().change_scene(next_scene_path)
