extends Node2D

var laser_class
var path_class: projectile_path_calc
var position_stuff

func _ready():
	# Load classes
	# laser_class = load("res://laser.gd").new([100, 100], [100, 100], load("res://sprites/idle.png"), 100, self)
	path_class = load("res://path calc final.gd").new(100, 1, 0, 0)
	
func _process(delta):
	position_stuff = path_class.calc_positions(delta)
	print(position_stuff)
	
func get_values():
	return [laser_class.central_position, laser_class.movement_range]
