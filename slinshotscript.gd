extends CharacterBody2D
# tutorial: https://www.youtube.com/watch?v=Azsw4NSc86w

enum flight_states {
	idle,
	pulling,
	flying,
}  # define the different states the character can be in

# Define/initialise variables
var line: Line2D
var player_state: flight_states
var path_calc_class = load("res://path calc final.gd")
var path_operator: projectile_path_calc = null
var intended_position: Vector2
var time: float = 0
var parent_node: Node2D
var camera: Camera2D
var camera_offset: float = 250

# Define constants
const SPEED_MODIFIER: int = 5
const LINE_DAMPING: float = 0.25
const MAX_LINE_COLOUR = 200


# Called when the character hits the floor, teleports the character back inside the boundaries
func handle_hit_floor() -> void:
	player_state = flight_states.idle  # Reset the movement calculator

	# Check whether to teleport the sprite to the top or bottom
	if position.y + parent_node.position.y < 100:
		position.y = 65 - parent_node.position.y
	else:
		position.y = 585 - parent_node.position.y


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initialize variables
	player_state = flight_states.idle
	line = $Line2D
	intended_position = position
	parent_node = get_parent()
	camera = parent_node.get_node("Camera2D")
	
	# Check the camera offset isn't larger than the screen size
	if camera_offset - 25 > (DisplayServer.window_get_size()[0] / 2):
		camera_offset = DisplayServer.window_get_size()[0] / 2

	# Set the camera position
	camera.position.y = (DisplayServer.window_get_size()[1] / 2.0) - parent_node.position.y

	# Connect to the floor node
	var floor_node: Node2D = get_tree().root.get_child(-1).get_child(-1)
	floor_node.hit_floor.connect(self.handle_hit_floor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	# Update the time
	time += delta * SPEED_MODIFIER

	# Identify which state the player is in
	match player_state:
		flight_states.idle:
			pass

		# Run the launching mechanics and line drawing
		flight_states.pulling:
			# Check if the player is dragging or has released
			if Input.is_action_pressed("left_click"):
				# Draw the line to the mouse
				line.visible = true
				var mouse_position: Vector2 = get_local_mouse_position()
				var line_end_pos: Vector2 = mouse_position
				# Calculate the line length
				var line_length: float = sqrt(pow(line_end_pos[0], 2) + pow(line_end_pos[1], 2))
				if line_length > MAX_LINE_COLOUR:
					line_length = MAX_LINE_COLOUR
				var red_value: float = line_length / MAX_LINE_COLOUR
				var blue_value: float = ((-1 * line_length) / MAX_LINE_COLOUR) + 1
				line.modulate = Color(red_value, 0, blue_value, 1)
				line.points[1] = line_end_pos
			elif Input.is_action_just_released("left_click"):
				# Launch the character
				# Calculate speed and angle from the line length
				var speed: float = (
					sqrt(pow(line.points[1][0], 2) + pow(line.points[1][1], 2))
					/ (SPEED_MODIFIER * LINE_DAMPING)
				)
				var angle: float = atan(line.points[1][1] / line.points[1][0])
				if line.points[1][0] > 0:
					angle += PI
				time = 0
				# Create the path calculator object and update the player state
				path_operator = path_calc_class.new(speed, angle, position.x, position.y)
				player_state = flight_states.flying
				line.visible = false
		flight_states.flying:
			# Make the character move
			velocity = path_operator.calc_velocities(time) * SPEED_MODIFIER
			move_and_slide()

	# Move the camera
	camera.position.x = position.x + camera_offset


# Called when the player clicks on the character's hit box
func _on_area_2d_input_event(_viewport, _event, _shape_idx) -> void:
	if player_state != flight_states.flying:
		player_state = flight_states.pulling
