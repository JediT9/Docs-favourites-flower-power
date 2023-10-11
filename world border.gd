extends Node2D

signal hit_floor  # Emitted when the player hits the floor/roof


# Called when the player collides with the floor/roof
func _on_area_2d_area_entered(_area):
	emit_signal("hit_floor")
