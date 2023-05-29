extends Camera2D

@export var panSpeed = 5.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	position += input_direction * panSpeed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	get_input()
