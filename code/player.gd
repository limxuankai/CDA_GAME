extends CharacterBody2D

var SPEED = 400.0
const MAX_HP = 3 
var HP = MAX_HP
@export var bullet = load("res://bullet.tscn")

@onready var gun_tip = $GunTip

func _ready():
	add_to_group("player")
	update_health_ui()
	$"Health Bar".max_value = MAX_HP
	$hurtbox.hurt.connect(_on_hit)
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	$Camera2D.enabled = true

func _physics_process(_delta):
	movement()
	
func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()
	
func shoot():
	var bullet = bullet.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = gun_tip.global_position
	var dir = (get_global_mouse_position() - gun_tip.global_position).normalized()
	bullet.direction = dir

func update_health_ui():
	$"Health Bar/Health Label".text = "HP: %s" % HP
	$"Health Bar".value = HP 

func _on_hit(damage):
	HP -= damage
	print("HP:", HP)
	if HP < 1:
		print("lose")
		call_deferred("_restart_game")
	update_health_ui()
		
func _restart_game():
	get_tree().reload_current_scene()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov,y_mov)
	velocity = mov.normalized() * SPEED
	move_and_slide()
