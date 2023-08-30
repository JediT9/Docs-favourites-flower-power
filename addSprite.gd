extends Node2D

var laser_class

func _ready():
	# Load classes
	print("hi")
	laser_class = load("res://laser.gd").new([100, 100], [100, 100], load("res://sprites/idle.png"), 100, self)
	print(laser_class)
	
func get_values():
	print("hi")
	print(laser_class)
	print(laser_class.return_info())
	return [laser_class.central_position, laser_class.movement_range]
