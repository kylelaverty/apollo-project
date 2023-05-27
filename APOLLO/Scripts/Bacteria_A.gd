extends CharacterBody2D

@export var inventory_data: InventoryData

@export var isSelected = false
@export var speed = 300.0
@export var doubling_rate = 8.0
var splitTimer = 0.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				isSelected = !isSelected

func split(pos):
	var sibling_Res = load("res://Scenes/Specimens/Bacteria_A.tscn")
	var sibling = sibling_Res.instantiate()
	sibling.position = pos + Vector2(70, 0).rotated(randf_range(0, 2*PI))
	add_sibling(sibling)

func _physics_process(delta):
	splitTimer += delta
	if splitTimer/doubling_rate >= 1.0:
		splitTimer = 0.0
		split(position)
	if isSelected:
		get_input()
		move_and_slide()
