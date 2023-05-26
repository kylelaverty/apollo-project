extends Control

func _on_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/menus/options_game_menu.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/menus/menu.tscn")

func _on_video_pressed():
	get_tree().change_scene_to_file("res://Scenes/menus/options_video_menu.tscn")

func _on_sound_pressed():
	pass # Replace with function body.
