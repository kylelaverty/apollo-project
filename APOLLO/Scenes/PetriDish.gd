extends Node2D

@export var inventory_data: InventoryData

func _ready() -> void:
	
	var itemDrop
	var item
	var destination
	
	for i in inventory_data.slot_datas:
		if i.item_data.name == "Speed Up":
			itemDrop = load("res://Scenes/items/SpeedUp.tscn")
			destination = "SpeedBonus"
		elif i.item_data.name == "Speed Down":
			itemDrop = load("res://Scenes/items/SpeedDown.tscn")
			destination = "SpeedMalus"
		elif i.item_data.name == "Heat Up":
			itemDrop = load("res://Scenes/items/HeatUp.tscn")
			destination = "HeatBonus"
		elif i.item_data.name == "Heat Down":
			itemDrop = load("res://Scenes/items/HeatDown.tscn")
			destination = "HeatMalus"
		elif i.item_data.name == "Size Up":
			itemDrop = load("res://Scenes/items/SizeUp.tscn")
			destination = "SizeBonus"
		elif i.item_data.name == "Size Down":
			itemDrop = load("res://Scenes/items/SizeDown.tscn")
			destination = "SizeMalus"

		while i.quantity > 0:
			item = itemDrop.instantiate()
			item.position = Vector2(randi_range(-800, 800), randi_range(-800, 800))
			get_node(destination).add_child(item)
			i.set_quantity(i.quantity-1)
			inventory_data.inventory_updated.emit(inventory_data)
