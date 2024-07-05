extends Node2D

@export var GreenEnemyScene: PackedScene
@export var YellowEnemyScene: PackedScene
@export var PinkEnemyScene: PackedScene

var margin = 8
var screen_widith = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component = $SpawnerComponent
@onready var green_enemy_spawner_timer = $GreenEnemySpawnerTimer
@onready var yellow_enemy_spawner_timer = $YellowEnemySpawnerTimer
@onready var pink_enemy_spawner_timer = $PinkEnemySpawnerTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	green_enemy_spawner_timer.timeout.connect(handle_spawn.bind(GreenEnemyScene, green_enemy_spawner_timer))
	yellow_enemy_spawner_timer.timeout.connect(handle_spawn.bind(YellowEnemyScene, yellow_enemy_spawner_timer))
	pink_enemy_spawner_timer.timeout.connect(handle_spawn.bind(PinkEnemyScene, pink_enemy_spawner_timer))

func handle_spawn(enemy_scene : PackedScene, timer: Timer) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_widith - margin), -16))
	timer.start()
	
