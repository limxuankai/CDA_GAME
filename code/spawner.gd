extends Node2D

@onready var enemy = load("res://enemy.tscn")
@export var spawn_area = Rect2(Vector2(0,0),Vector2(1152,648))
	
func _ready():
	$Timer.autostart = true
	$Timer.one_shot = false
	$Timer.wait_time = 2
	$Timer.timeout.connect(_on_timer_timeout)
	$Timer.start()

func _on_timer_timeout():
	print("spawn")
	var ene = enemy.instantiate()
	var x = randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x)
	var y = randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
	ene.global_position = Vector2(x,y)
	add_child(ene)
