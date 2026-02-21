extends CharacterBody2D

var SPEED = 50.0
@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*SPEED
	move_and_slide()
