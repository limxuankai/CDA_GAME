extends Area2D

signal hurt(damage)

var current_hitbox = null   # stores the enemy hitbox we're touching

func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	$Timer.timeout.connect(_on_timer_timeout)
	$Timer.wait_time = 1.5   # cooldown between hits
	$Timer.one_shot = false  # repeat automatically

func _on_area_entered(area):
	if area.is_in_group("hitbox"):
		print("Entered hitbox")
		current_hitbox = area
		$Timer.start()

func _on_area_exited(area):
	if area == current_hitbox:
		print("Left hitbox")
		current_hitbox = null
		$Timer.stop()

func _on_timer_timeout():
	if current_hitbox:
		emit_signal("hurt", current_hitbox.damage)
		print("Damage dealt:", current_hitbox.damage)
