# Trial 1
extends Sprite2D
const Y_ACCELERATION: float = -9.81
const X_ACCELERATION: float = 0.0
var time: float = 0
var x_position: float = 0.0
var y_position: float = 0.0
var initial_velocity: float = 100
var initial_angle: float = deg_to_rad(45)
var x_velocity: float = initial_velocity * cos(initial_angle)
var y_velocity: float = initial_velocity * sin(initial_angle)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update velocities and positions
	y_velocity += (Y_ACCELERATION * delta)
	x_velocity += (X_ACCELERATION * delta)
	x_position += x_velocity * delta
	y_position += y_velocity * delta
	
	position.x = x_position
	position.y = y_position
