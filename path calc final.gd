# Initial conditions of the launch
var launch_velocity: float
var launch_angle: float
var initial_y_pos: float
var initial_x_pos: float
var initial_y_velocity: float
var initial_x_velocity: float


# Return the initial velocity in the x-direction
func initial_x(initial_velocity: float, initial_angle: float):
	var x_velocity_initial: float = initial_velocity * cos(initial_angle)
	initial_x_velocity = x_velocity_initial


# Return the initial velocity in the y-direction
func initial_y(initial_velocity: float, initial_angle: float):
	var y_velocity_initial: float = initial_velocity * sin(initial_angle)
	initial_y_velocity = y_velocity_initial


# Return the distance travelled in the y-direction after a given time
func calculate_y_dist(time: float):
	# Define constants
	const Y_ACCELERATION: float = -9.81
	const ACCELERATION_EXP: int = 2
	const ACCELERATION_MULTIPLIER: float = 0.5

	# Do calculations
	var y_distance: float = (
		time * initial_y_velocity
		+ ACCELERATION_MULTIPLIER * Y_ACCELERATION * pow(time, ACCELERATION_EXP)
	)
	return y_distance


# Return the distance travelled in the x-direction after a given time
func calculate_x_dist(time: float):
	var x_distance: float = time * initial_x_velocity
	return x_distance


# Calculate the actual positions after a time
func calc_positions(time):
	var position_y: float = calculate_y_dist(time) + initial_y_pos
	var position_x: float = calculate_x_dist(time) + initial_x_pos
	return [position_x, position_y]
