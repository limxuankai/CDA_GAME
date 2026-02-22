extends CharacterBody2D

var SPEED = 400.0
var HP = 3

func _ready():
	add_to_group("player")
	$hurtbox.hurt.connect(_on_hit)

func _on_hit(damage):
	HP -= damage
	print("HP:", HP)
	if HP < 1:
		print("lose")
		get_tree().reload_current_scene()

func _physics_process(_delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov,y_mov)
	velocity = mov.normalized() * SPEED
	move_and_slide()
