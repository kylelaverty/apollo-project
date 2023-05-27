extends Node2D

@onready var scientist: CharacterBody2D = $scientist
@onready var inventory_interface: Control = $UI/InventoryInterface

func _ready() -> void:
	inventory_interface.set_player_inventory_data(scientist.inventory_data)
