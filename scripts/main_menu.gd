class_name MainMenu
extends Control

#Main Game Scene
@onready var game = preload("res://scenes/game.tscn") as PackedScene

#Play, Options, Quit Buttons
@onready var play_button = $MarginContainer/HBoxContainer/VBoxContainer/PlayButton as Button
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/OptionsButton as Button
@onready var quit_button = $MarginContainer/HBoxContainer/VBoxContainer/QuitButton

signal mm_play_requested
signal mm_options_requested
signal mm_quit_requested

func _ready():
	handle_mainmenu_signals()

func _on_play_pressed() -> void:
	mm_play_requested.emit()
	

func _on_options_pressed() -> void:
	mm_options_requested.emit()
	
func _on_quit_pressed() -> void:
	mm_quit_requested.emit()
	
func handle_mainmenu_signals() -> void:
	play_button.button_down.connect(_on_play_pressed)
	options_button.button_down.connect(_on_options_pressed)
	quit_button.button_down.connect(_on_quit_pressed)
