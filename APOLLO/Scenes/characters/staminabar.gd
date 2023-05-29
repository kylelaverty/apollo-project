extends Control

@onready var progress_bar = $MarginContainer/ProgressBar

func change_stamina(stamina: int):
	progress_bar.value = stamina
