extends Node2D

var sprite = Sprite2D.new()

func _ready():
	print("Hi")
	sprite.texture = load("res://sprites/idle.png")
	sprite.position.x = 300
	sprite.position.y = 300
	self.add_child(sprite)
