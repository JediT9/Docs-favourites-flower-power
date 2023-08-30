class_name laser_object extends Sprite2D

# Initiate variables
var central_position: Array[float]
var size: Array[float]
var laser_texture
var movement_range: int = 0
var time_elapsed: float = 0


# Called when the node enters the scene tree for the first time.
func _init():
	# Create nodes
	var laser_sprite = Sprite2D.new()
	var laser_area: Area2D = Area2D.new()
	var laser_collision_area: CollisionShape2D = CollisionShape2D.new()
	var laser_shape: RectangleShape2D = RectangleShape2D.new()
	
	# Assign shape to the laser shape
	laser_sprite.texture = laser_texture
	laser_sprite.set_script(load("res://laser_movement.gd"))
	laser_shape.size = Vector2(size[0], size[1])
	laser_collision_area.shape = laser_shape
	
	# Add nodes to scene tree
	laser_area.add_child(laser_collision_area)
	laser_sprite.add_child(laser_area)
	self.add_child(laser_sprite)
