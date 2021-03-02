extends Button

func _on_Retry_pressed():
	print("reload")
	#get_tree().reload_current_scene()
	get_tree().change_scene("res://src/Level/Dev.tscn")
