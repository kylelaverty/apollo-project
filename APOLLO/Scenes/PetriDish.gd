extends Node2D

@export var inventory_data: InventoryData

func _ready() -> void:
	
	var itemDrop
	
	for i in inventory_data.slot_datas:
		if i.item_data.name == "Speed Up":
			itemDrop = load("res://Scenes/items/SpeedUp.tscn")
		elif i.item_data.name == "Speed Down":
			itemDrop = load("res://Scenes/items/SpeedDown.tscn")
		elif i.item_data.name == "Heat Up":
			itemDrop = load("res://Scenes/items/HeatUp.tscn")
		elif i.item_data.name == "Heat Down":
			itemDrop = load("res://Scenes/items/HeatDown.tscn")
		elif i.item_data.name == "Size Up":
			itemDrop = load("res://Scenes/items/SizeUp.tscn")
		elif i.item_data.name == "Size Down":
			itemDrop = load("res://Scenes/items/SizeDown.tscn")

		while i.quantity > 0:
			var item = itemDrop.instantiate()
			item.position = Vector2(randi_range(-800, 800), randi_range(-800, 800))
			add_child(item)
			i.set_quantity(i.quantity-1)
			inventory_data.inventory_updated.emit(inventory_data)
