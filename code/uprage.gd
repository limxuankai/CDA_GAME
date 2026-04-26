extends Button

@onready var Name = $Label_Name
@onready var Description = $Label_Description
@onready var Level = $Label_Level
@onready var Icon = $ColorRect/Icon

var mouse_over = false
var item = null
@onready var player = get_tree().get_first_node_in_group("player")

signal selected_upgrade(upgrade)

func _ready():
	# Connect the 'pressed' signal to a local function
	$".".pressed.connect(_on_my_button_pressed)
	connect("selected_upgrade", Callable(player, 'upgrade_character'))

func _on_my_button_pressed():
	emit_signal("selected_upgrade",item)
	print("Clicked")
