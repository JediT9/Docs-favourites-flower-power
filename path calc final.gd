# Trial 3
extends Sprite2D
const Y_ACCELERATION: float = -9.81
const X_ACCELERATION: float = 0.0
const ACCELERATION_TO_EQUATION: int = 2
var time: float = 0
var initial_velocity: float = 10
var initial_angle: float = deg_to_rad(45)
var y_distance: float
var x_velocity_initial: float = initial_velocity * cos(initial_angle)
var y_velocity_initial: float = initial_velocity * sin(initial_angle)
const ACCELERATION_MULTIPLIER: float = 0.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	y_distance = time*y_velocity_initial + ACCELERATION_MULTIPLIER*Y_ACCELERATION*pow(time, ACCELERATION_TO_EQUATION)
	position.y = y_distance
	position.x = x_velocity_initial * time
