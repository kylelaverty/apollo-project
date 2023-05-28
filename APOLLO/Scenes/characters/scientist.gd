extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _footsteps = $Footsteps
@onready var _footsteps_timer = $FootstepsTimer

@export var inventory_data: InventoryData

@export var hazmat: bool = false
@export var speed: int = 150

@export_category("Effort")
@export var effort: int = 100
@export var effort_hazmat: int = 5
@export var effort_buff: int = 25

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

func play_sound():
	if velocity != Vector2.ZERO and !_footsteps.playing and _footsteps_timer.time_left <= 0:
		_footsteps.pitch_scale = randf_range(0.8, 1.2)
		_footsteps.play()
		_footsteps_timer.start(0.35)

func _physics_process(_delta):
	get_input()
	set_animation()
	play_sound()
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
	if effort >= effort_buff:
		effort = effort - effort_buff
		inventory_data.slot_datas[2].set_quantity(inventory_data.slot_datas[2].quantity+1)
		inventory_data.inventory_updated.emit(inventory_data)

func _on_heat_down_zone_body_entered(_body):
	if effort >= effort_buff:
		effort = effort - effort_buff
		inventory_data.slot_datas[3].set_quantity(inventory_data.slot_datas[3].quantity+1)
		inventory_data.inventory_updated.emit(inventory_data)

func _on_speed_up_zone_body_entered(_body):
	if effort >= effort_buff:
		effort = effort - effort_buff
		inventory_data.slot_datas[0].set_quantity(inventory_data.slot_datas[0].quantity+1)
		inventory_data.inventory_updated.emit(inventory_data)

func _on_speed_down_zone_body_entered(_body):
	if effort >= effort_buff:
		effort = effort - effort_buff
		inventory_data.slot_datas[1].set_quantity(inventory_data.slot_datas[1].quantity+1)
		inventory_data.inventory_updated.emit(inventory_data)

func _on_size_up_zone_body_entered(_body):
	if effort >= effort_buff:
		effort = effort - effort_buff
		inventory_data.slot_datas[4].set_quantity(inventory_data.slot_datas[4].quantity+1)
		inventory_data.inventory_updated.emit(inventory_data)

func _on_size_down_zone_body_entered(_body):
	if effort >= effort_buff:
		effort = effort - effort_buff
		inventory_data.slot_datas[5].set_quantity(inventory_data.slot_datas[5].quantity+1)
		inventory_data.inventory_updated.emit(inventory_data)

func _on_petri_zone_body_entered(_body):
	get_tree().change_scene_to_file("res://Scenes/PetriDish.tscn")
