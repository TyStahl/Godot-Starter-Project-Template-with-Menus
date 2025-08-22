class_name OptionsMenu

extends Control

@onready var back_button = $MarginContainer/VBoxContainer/BackButton as Button

signal om_exit_options_menu
signal volume_changed(bus_name: String, volume: float)

func _ready():
	handle_connecting_signals()

func _on_back_pressed() -> void:
	om_exit_options_menu.emit()

func _on_volume_changed(value) -> void:
	volume_changed.emit("Master", value)

func handle_connecting_signals() -> void:
	back_button.button_down.connect(_on_back_pressed)
