# Trial 2
extends Sprite2D
const Y_ACCELERATION: float = -9.81
const X_ACCELERATION: float = 0.0
const ACCELERATION_TO_EQUATION: int = 2
var time: float = 0
var initial_velocity: float = 10
var initial_angle: float = deg_to_rad(45)
var x_velocity: float = initial_velocity * cos(initial_angle)
var y_velocity: float = initial_velocity * sin(initial_angle)
var a_value: float = Y_ACCELERATION/ACCELERATION_TO_EQUATION
var y_position: float
var x_position: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	y_position = pow(time, 2)*a_value + time*y_velocity
	x_position = x_velocity*time
	print(x_position)
	print(y_position)
	print()
	position.x = x_position
	position.y = y_position
	
