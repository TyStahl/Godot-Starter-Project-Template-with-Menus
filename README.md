# Godot Starter Project Template with Menus
 
This is a very basic Starter Project Template.
Feel free to create new projects from this template.
Included are a basic Main Menu, Pause Menu, and Options Menu.

Additionally, the basic project architecture is set up like this: 

UI/boot_strap is the main scene; It will run a splash and removes itself to be replaced by main as the "root".
Main contains only the UIManager and GameContainer - a 2d/3d agnostic base Node - simply an attachment place for Game, Level, etc. 
Game contains a Node2D and StaticBody2D/Sprite2D with base Godot Icon centered and set to spin indefinitely as a placeholder.  

I created this project for myself and for anyone interested. 

Credit:
	CoffeeCrow, primarily, for his menu tutorials, which gave me a great start.
	
	Generally, also, the Godot Youtube community. 

TO-DO:
	Basic audio/video/controls and settings/saves configs. 
