extends Area2D

var damage = 1
var speed = 800
var direction = Vector2.ZERO

func _ready():
	add_to_group("bullet")
	
func upgrade_damage(amount):
	damage += amount

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.take_damage(damage)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
