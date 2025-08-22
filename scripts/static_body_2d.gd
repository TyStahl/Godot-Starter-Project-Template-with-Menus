extends StaticBody2D


func _process(delta):
	rotation += deg_to_rad(30) * delta  # spin 30° per second
