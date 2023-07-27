extends Sprite2D
const Y_ACCELERATION: float = -9.81
const X_ACCELERATION: float = 0.0
var time: float = 0
var x_position: float = 0.0
var y_position: float = 0.0
var initial_velocity: float = 10
var initial_angle: float = deg_to_rad(45)
var x_velocity: float = initial_velocity * cos(initial_angle)
var y_velocity: float = initial_velocity * sin(initial_angle)

func _init():
	
	pass
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update velocities and positions
	y_velocity += (Y_ACCELERATION * delta)
	x_velocity += (X_ACCELERATION * delta)
	x_position += x_velocity * delta
	y_position += y_velocity * delta
	
	print(x_velocity)
	print(y_velocity)
	print(x_position)
	print(y_position)
	print()
	position.x = x_position
	position.y = y_position
