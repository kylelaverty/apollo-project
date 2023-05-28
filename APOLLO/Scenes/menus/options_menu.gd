extends Control

@onready var button_click = $ButtonClick

func _on_game_pressed():
	button_click.play()
	await button_click.finished
	get_tree().change_scene_to_file("res://Scenes/menus/options_game_menu.tscn")

func _on_back_pressed():
	button_click.play()
	await button_click.finished
	get_tree().change_scene_to_file("res://Scenes/menus/menu.tscn")

func _on_video_pressed():
	button_click.play()
	await button_click.finished
	get_tree().change_scene_to_file("res://Scenes/menus/options_video_menu.tscn")

func _on_sound_pressed():
	button_click.play()
	await button_click.finished

func _on_credits_pressed():
	button_click.play()
	await button_click.finished
	get_tree().change_scene_to_file("res://Scenes/menus/options_credits_menu.tscn")

func _on_controls_pressed():
	button_click.play()
	await button_click.finished
	get_tree().change_scene_to_file("res://Scenes/menus/options_controls_menu.tscn")
