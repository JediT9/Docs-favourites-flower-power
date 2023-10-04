extends Node2D

signal hit_floor

func _on_area_2d_area_entered(area):
	emit_signal("hit_floor")
