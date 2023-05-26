extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

@export var hazmat = false
@export var speed = 150

@export_category("Effort")
@export var effort = 100
@export var effort_hazmat = 10
@export var effort_buff = 30

@export_category("Inventory")
@export var heatUp = false
@export var coldUp = false
@export var speedUp = false
@export var slowUp = false
@export var growUp = false
@export var shrinkUp = false

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

func _on_hazmat_on_zone_body_exited(_body):
	if hazmat == false && effort > effort_hazmat:
		effort = effort - effort_hazmat
	hazmat = true

func _on_hazmat_off_zone_body_exited(_body):
	if hazmat == true && effort > effort_hazmat:
		effort = effort - effort_hazmat
	hazmat = false

func _on_heat_up_zone_body_entered(_body):
	if effort >= effort_buff && heatUp != true:
		effort = effort - effort_buff
		heatUp = true

func _on_heat_down_zone_body_entered(_body):
	if effort >= effort_buff && coldUp != true:
		effort = effort - effort_buff
		coldUp = true

func _on_speed_up_zone_body_entered(_body):
	if effort >= effort_buff && speedUp != true:
		effort = effort - effort_buff
		speedUp = true

func _on_speed_down_zone_body_entered(_body):
	if effort >= effort_buff && slowUp != true:
		effort = effort - effort_buff
		slowUp = true

func _on_size_up_zone_body_entered(_body):
	if effort >= effort_buff && growUp != true:
		effort = effort - effort_buff
		growUp = true

func _on_size_down_zone_body_entered(_body):
	if effort >= effort_buff && shrinkUp != true:
		effort = effort - effort_buff
		shrinkUp = true

func _on_end_day_zone_body_entered(_body):
	effort = 100
	heatUp = false
	coldUp = false
	speedUp = false
	slowUp = false
	growUp = false
	shrinkUp = false

func _on_petri_zone_body_entered(_body):
	# somehow send things to the other view
	pass # Replace with function body.
