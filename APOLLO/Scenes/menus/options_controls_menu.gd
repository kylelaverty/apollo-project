extends Control

@onready var button_click = $ButtonClick

func _on_back_pressed():
	button_click.play()
	await button_click.finished
	get_tree().change_scene_to_file("res://Scenes/menus/options_menu.tscn")
