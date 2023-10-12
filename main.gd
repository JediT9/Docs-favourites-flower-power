extends Node2D

var laser_class: Resource
var path_class: Resource
var spike_class: Resource
var obstacles: Dictionary
var current_laser: Array
var spikes: Array
var lasers: Array
var path: projectile_path_calc
var position_stuff


func _ready():
	# Load classes
	laser_class = load("res://laser.gd")
	path_class = load("res://path calc final.gd")
	spike_class = load("res://spike.gd")

	# Create obstacles
	spikes = []
	lasers = []

	# Create player data
	path = path_class.new(10, 1, 100, 100)

	# Create spikes
	spikes.append(spike_class.new([600, 600], [50, 50], self, load("res://spike.svg")))

	# Create lasers
	create_laser([300, 300], [100, 100], load("res://lazer.svg"), 100, self)
	create_laser([1000, 600], [100, 100], load("res://lazer.svg"), 0, self)
	create_laser([2000, 0], [100, 100], load("res://lazer.svg"), 50, self)


# Create a laser using specified values
func create_laser(laser_position, size, image, movement, node):
	# Update the current laser then create a laser
	current_laser = [laser_position, movement]
	var new_laser: laser_object = laser_class.new(laser_position, size, image, movement, node)
	lasers.append(new_laser)


func _process(delta):
	# gets the position values for the character
	position_stuff = path.calc_positions(delta)


func get_values():
	return current_laser
