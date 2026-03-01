extends Node2D

@onready var enemy = load("res://enemy.tscn")

func _ready():
	$Timer.autostart = true
	$Timer.one_shot = false
	$Timer.wait_time = 2
	$Timer.timeout.connect(_on_timer_timeout)
	$Timer.start()

func _on_timer_timeout():
	print("spawn")
	var ene = enemy.instantiate()
	add_child(ene)
