extends Node2D

func _ready():
	# Load classes
	var laser_class = load("res://laser.gd").new([100, 100], [100, 100], load("res://sprites/idle.png"), 100)

