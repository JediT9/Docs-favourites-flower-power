class_name projectile_path_calc

# Initial conditions of the launch
var launch_velocity: float
var launch_angle: float
var initial_y_pos: float
var initial_x_pos: float
var initial_y_velocity: float
var initial_x_velocity: float
var time: float = 0

# Define constants
const Y_ACCELERATION: float = 9.81
const ACCELERATION_EXP: int = 2
const ACCELERATION_MULTIPLIER: float = 0.5


# Initialize the class
func _init(velocity, angle, x_pos, y_pos) -> void:
	# Assign initial variables
	launch_velocity = velocity
	launch_angle = angle
	initial_x_pos = x_pos
	initial_y_pos = y_pos

	# Calculate initial velocities
	initial_x_velocity = velocity * cos(angle)
	initial_y_velocity = velocity * sin(angle)


# Return the distance travelled in the y-direction after a given time
func calculate_y_dist(time: float) -> float:
	# Do calculations
	var y_distance: float = (
		time * initial_y_velocity
		+ ACCELERATION_MULTIPLIER * Y_ACCELERATION * pow(time, ACCELERATION_EXP)
	)
	return y_distance


# Return the distance travelled in the x-direction after a given time
func calculate_x_dist(time: float) -> float:
	var x_distance: float = time * initial_x_velocity
	return x_distance


# Calculate the actual positions after a time
func calc_positions(delta: float) -> Vector2:
	time += delta
	var position_y: float = calculate_y_dist(time) + initial_y_pos
	var position_x: float = calculate_x_dist(time) + initial_x_pos
	return Vector2(position_x, position_y)
