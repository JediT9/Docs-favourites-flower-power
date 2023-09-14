extends Node2D

var laser_class: laser_object
var path_class: projectile_path_calc
var spike_class: spike_object
var position_stuff

func _ready():
	# Load classes
	# laser_class = load("res://laser.gd").new([100, 100], [100, 100], load("res://sprites/idle.png"), 100, self)
	path_class = load("res://path calc final.gd").new(100, 1, 0, 0)
	spike_class = load("res://spike.gd").new([600, 600], [50, 50], self, load("res://sprites/jump.png"))
	
func _process(delta):
	# gets the position values for the character
	position_stuff = path_class.calc_positions(delta)
	
func get_values():
	return [laser_class.central_position, laser_class.movement_range]
