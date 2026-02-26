extends Node2D


"""
var level = 1 
var hp = 1 
var speed = 100
var damage = 1
var attack_size = 1.0 

var target = Vector2.ZERO
var angle = Vector2.ZERO

@onready var player = get_tree().get_first_node_in_group("player")
@onready var enemy = get_tree().get_first_node_in_group("enemy")

func _ready():
	angle = global_position.direction_to(target)
	rotation = angle.angle() + deg_to_rad(135)
	match level:
		1:
			hp = 1 
			speed = 100
			damage =  1
			attack_size= 1

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	var velocity = angle * speed
	move_and_slide()
"""
