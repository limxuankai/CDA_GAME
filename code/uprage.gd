extends ColorRect

@onready var rect1 = $ColorRect
@onready var rect2 = $ColorRect2
@onready var rect3 = $ColorRect3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	var mouse_pos = get_global_mouse_position()
	if event is InputEventMouseButton and event.pressed:
		if rect1.get_global_rect().has_point(mouse_pos):
			print ("1")
			get_tree().call_group("player", "upgrade_reload", 20)
			get_tree().paused = false
			queue_free()
		elif rect2.get_global_rect().has_point(mouse_pos):
			print ("2")
			get_tree().call_group("player", "upgrade_speed", 2000)
			get_tree().paused = false
			queue_free()
		elif rect3.get_global_rect().has_point(mouse_pos):
			print ("3")
			get_tree().call_group("player", "upgrade_damage", 10)
			get_tree().paused = false
			queue_free()
