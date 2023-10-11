extends CharacterBody2D
# tutorial: https://www.youtube.com/watch?v=Azsw4NSc86w

enum flight_states {
	idle,
	pulling,
	flying,
	reset,
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

# Define constants
const speed_modifier: int = 5
const line_damping: float = 0.5


# Called when the character hits the floor, teleports the character back inside the boundaries
func handle_hit_floor():
	player_state = flight_states.idle  # Reset the movement calculator

	# Check whether to teleport the sprite to the top or bottom
	if position.y + parent_node.position.y < 100:
		position.y = 65 - parent_node.position.y
	else:
		position.y = 585 - parent_node.position.y


# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize variables
	player_state = flight_states.idle
	line = $Line2D
	intended_position = position
	parent_node = get_parent()
	camera = parent_node.get_node("Camera2D")

	# Set the camera position
	camera.position.y = (DisplayServer.window_get_size()[1] / 2.0) - parent_node.position.y

	# Connect to the floor node
	var floor_node: Node2D = get_tree().root.get_child(-1).get_child(-1)
	floor_node.hit_floor.connect(self.handle_hit_floor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update the time
	time += delta * speed_modifier

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
				line.points[1] = line_end_pos
			elif Input.is_action_just_released("left_click"):
				# Launch the character
				# Calculate speed and angle from the line length
				var speed: float = (
					sqrt(pow(line.points[1][0], 2) + pow(line.points[1][1], 2))
					/ (speed_modifier * line_damping)
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
			velocity = path_operator.calc_velocities(time) * speed_modifier
			move_and_slide()

	# Move the camera
	camera.position.x = position.x


# Called when the player clicks on the character's hit box
func _on_area_2d_input_event(viewport, event, shape_idx):
	if player_state != flight_states.flying:
		player_state = flight_states.pulling
