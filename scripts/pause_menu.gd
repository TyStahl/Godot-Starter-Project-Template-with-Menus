class_name PauseMenu
extends Control

@onready var resume_button = $MarginContainer/HBoxContainer/VBoxContainer/ResumeButton as Button
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/OptionsButton as Button
@onready var quit_button = $MarginContainer/HBoxContainer/VBoxContainer/QuitButton as Button

signal pm_resume_requested
signal pm_options_requested
signal pm_quit_requested

func _ready():
	handle_pausemenu_signals()

func _on_resume_pressed() -> void:
	pm_resume_requested.emit()

func _on_options_pressed() -> void:
	pm_options_requested.emit()
	
func _on_quit_pressed() -> void:
	pm_quit_requested.emit()

func handle_pausemenu_signals():
	resume_button.button_down.connect(_on_resume_pressed)
	options_button.button_down.connect(_on_options_pressed)
	quit_button.button_down.connect(_on_quit_pressed)
	#options_menu.exit_options_menu.connect(on_back_options_menu)
