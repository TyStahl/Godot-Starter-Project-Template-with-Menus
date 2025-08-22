extends Node

@onready var ui_manager = $UIManager
@onready var game_container = $GameContainer
@onready var game_scene = preload("res://scenes/game.tscn") # Adjust path

func _ready():
	ui_manager.play_requested.connect(_on_play_requested)

func _on_play_requested() -> void:
	start_game()

func start_game():
	
	# Clear any existing children in GameContainer
	game_container.clear()

	# Instance the game scene
	var game_instance = game_scene.instantiate()

	# Add it to GameContainer
	game_container.add_child(game_instance)
	
