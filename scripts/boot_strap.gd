extends Node

@onready var splash = $Splash
var main_scene := preload("res://scenes/main.tscn") 

func _ready():
	# Show splash for 2 seconds, then continue
	await get_tree().create_timer(4.0).timeout
	launch_game()

func launch_game():
	# Load and add the main game or main scene
	var main_instance = main_scene.instantiate()
	get_tree().root.add_child(main_instance)

	# Clean up splash and self
	splash.queue_free()
	queue_free()
