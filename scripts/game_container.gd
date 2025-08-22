extends Node

func clear():
	for child in get_children():
		child.queue_free()

func load_scene(packed_scene: PackedScene):
	clear()
	var instance = packed_scene.instantiate()
	add_child(instance)
