extends Control

@onready var button_click = $ButtonClick

func _on_play_pressed():
	button_click.play()
	await button_click.finished
	get_tree().change_scene_to_file("res://Scenes/ScienceLab.tscn")

func _on_options_pressed():
	button_click.play()
	await button_click.finished
	get_tree().change_scene_to_file("res://Scenes/menus/options_menu.tscn")

func _on_quit_pressed():
	button_click.play()
	await button_click.finished
	get_tree().quit()
