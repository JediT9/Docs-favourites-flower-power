class_name ProjectilePathCalc

# Initial conditions of the launch
var launch_velocity: float
var launch_angle: float
var initial_y_pos: float
var initial_x_pos: float
var initial_y_velocity: float
var initial_x_velocity: float

# Define constants
const Y_ACCELERATION: float = 10
const ACCELERATION_EXP: int = 2
const ACCELERATION_MULTIPLIER: float = 0.5
const VELOCITY_MULTIPLIER: int = 1


# Initialize the class
func _init(velocity, angle, x_pos, y_pos) -> void:
	# Assign initial variables
	launch_velocity = velocity * VELOCITY_MULTIPLIER
	launch_angle = angle
	initial_x_pos = x_pos
	initial_y_pos = y_pos

	# Calculate initial velocities
	initial_x_velocity = launch_velocity * cos(angle)
	initial_y_velocity = launch_velocity * sin(angle)

# Calculate and return the y-velocity of the character
func calculate_y_velocity(time: float) -> float:
	var speed: float = initial_y_velocity + Y_ACCELERATION * time
	return speed


# Return the character's velocities
func calc_velocities(time: float) -> Vector2:
	return Vector2(initial_x_velocity, calculate_y_velocity(time))
