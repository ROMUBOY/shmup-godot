extends Node2D

@onready var ship = $ship

# Called when the node enters the scene tree for the first time.
func _ready():
	ship.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://menus/game_over.tscn")
	)
