extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

func _process(delta):
	if Input.is_action_pressed("right"):
		_animated_sprite.play("walk_right")
	elif Input.is_action_pressed("left"):
		_animated_sprite.play("walk_left")
	elif Input.is_action_pressed("down"):
		_animated_sprite.play("walk_down")
	elif Input.is_action_pressed("up"):
		_animated_sprite.play("walk_up")
	else:
		_animated_sprite.stop()
