extends Node2D

var laser_class

func _ready():
	# Load classes
	laser_class = load("res://laser.gd").new([100, 100], [100, 100], load("res://sprites/idle.png"), 100, self)
	
func get_values():
	return [laser_class.central_position, laser_class.movement_range]