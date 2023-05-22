extends CharacterBody2D

@export var isSelected = false
@export var speed = 300.0
var splitTimer = 0.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func split(pos):
	var sibling_Res = preload("res://Scenes/Specimens/Bacteria_A.tscn")
	var sibling = sibling_Res.instantiate()
	sibling.position = pos + Vector2(70, 0).rotated(randf_range(0, 2*PI))
	add_sibling(sibling)

func _physics_process(delta):
	splitTimer += delta
	if splitTimer/10.0 >= 1.0:
		splitTimer = 0.0
		split(position)
	if isSelected:
		get_input()
		move_and_slide()
