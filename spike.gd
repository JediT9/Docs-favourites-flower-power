class_name spike_object

# Define initial variables
var center_position: Array
var size: Array
var head_node: Node2D


func _init(central_position, spike_size, node, texture):
	# Check variables contain correct datatypes
	if typeof(central_position) != TYPE_ARRAY:
		# Call reset function
		pass

	if typeof(spike_size) != TYPE_ARRAY:
		# Call reset function
		pass

	if typeof(node) != TYPE_OBJECT:
		# Call reset function
		pass

	if typeof(texture) != TYPE_OBJECT:
		# Call reset function
		pass

	# Assign values to class data
	center_position = central_position
	size = spike_size
	head_node = node

	# Create nodes
	var spike_sprite: Sprite2D = Sprite2D.new()
	var spike_area: Area2D = Area2D.new()
	var spike_collision_box: CollisionShape2D = CollisionShape2D.new()
	var spike_shape: RectangleShape2D = RectangleShape2D.new()

	# Assign values to nodes
	spike_sprite.texture = texture
	spike_shape.size = Vector2(size[0], size[1])
	spike_collision_box.shape = spike_shape
	spike_sprite.position.x = central_position[0]
	spike_sprite.position.y = central_position[1]

	# Add nodes to scene tree
	spike_area.add_child(spike_collision_box)
	spike_sprite.add_child(spike_area)
	head_node.add_child(spike_sprite)
