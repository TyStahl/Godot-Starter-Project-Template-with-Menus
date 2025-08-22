extends CanvasLayer

@onready var main_menu = $MainMenu as MainMenu
@onready var pause_menu = $PauseMenu as PauseMenu
@onready var options_menu = $OptionsMenu as OptionsMenu

var game_started := false
signal play_requested

func _ready():
	_connect_menu_signals()
	_show_main_menu()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and game_started:
		_toggle_pause()

# --- Signal Wiring ---

func _connect_menu_signals():
	# Main Menu
	main_menu.mm_play_requested.connect(_on_play_pressed)
	main_menu.mm_options_requested.connect(_on_options_requested)
	main_menu.mm_quit_requested.connect(_on_quit_requested)
	
	# Pause Menu
	pause_menu.pm_resume_requested.connect(_on_resume_pressed)
	pause_menu.pm_options_requested.connect(_on_options_requested)
	pause_menu.pm_quit_requested.connect(_on_quit_requested)

	# Options Menu
	options_menu.om_exit_options_menu.connect(_on_options_exit)

# --- UI Logic Handlers ---

func _on_play_pressed():
	main_menu.visible = false
	options_menu.visible = false
	game_started = true
	get_tree().paused = false
	play_requested.emit()

func _on_resume_pressed():
	pause_menu.visible = false
	options_menu.visible = false
	get_tree().paused = false

func _on_quit_requested():
	get_tree().quit()

func _on_options_requested():
	main_menu.visible = false
	pause_menu.visible = false
	options_menu.visible = true

func _on_options_exit():
	options_menu.visible = false
	if not game_started:
		main_menu.visible = true
	else:
		pause_menu.visible = true

# --- Pause/Unpause ---

func _toggle_pause():
	get_tree().paused = not get_tree().paused
	pause_menu.visible = get_tree().paused

# --- Show main menu at launch ---

func _show_main_menu():
	main_menu.visible = true
	pause_menu.visible = false
	options_menu.visible = false
	get_tree().paused = true
	game_started = false
