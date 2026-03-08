extends CharacterBody2D

var health = 3
var SPEED = 50.0
@onready var player = get_tree().get_first_node_in_group("player")

func _ready():
	add_to_group("enemy")
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*SPEED
	move_and_slide()

func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()
