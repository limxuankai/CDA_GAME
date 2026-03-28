extends CharacterBody2D

var health = 3
var SPEED = 50.0
@export var experience = 1
@onready var loot_base = get_tree().get_first_node_in_group("loot")
var exp_gem = preload("res://objects/exp.tscn")
@onready var player = get_tree().get_first_node_in_group("player")

func _ready():
	add_to_group("enemy")
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING #Prevent sticking to player

func _physics_process(_delta):
	velocity = global_position.direction_to(player.global_position)*SPEED
	move_and_slide()

func take_damage(amount):
	health -= amount
	if health <= 0:
		death()

func death():
	var new_gem = exp_gem.instantiate()
	new_gem.global_position = global_position
	new_gem.experience = experience
	loot_base.call_deferred("add_child",new_gem)
	queue_free()
