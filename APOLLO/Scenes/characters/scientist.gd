extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

@export var hazmat = false
@export var speed = 150

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func set_animation():
	if Input.is_action_pressed("right"):
		_animated_sprite.play("walk_right" if !hazmat else "hazmat_right")
	elif Input.is_action_pressed("left"):
		_animated_sprite.play("walk_left" if !hazmat else "hazmat_left")
	elif Input.is_action_pressed("down"):
		_animated_sprite.play("walk_down" if !hazmat else "hazmat_down")
	elif Input.is_action_pressed("up"):
		_animated_sprite.play("walk_up" if !hazmat else "hazmat_up")
	else:
		_animated_sprite.stop()

func _physics_process(_delta):
	get_input()
	set_animation()
	move_and_slide()

func _on_hazmat_zone_body_exited(_body):
	hazmat = true

func _on_hazmat_off_zone_body_exited(body):
	hazmat = false
