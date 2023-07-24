extends Sprite2D

func _init():
	pass
	
# Trial option 1 for calculating the path recalculating every time step
func trial_1(initial_velocity, initial_angle):
	
	# Set up variables
	var x_position: float = 0.0
	var y_position: float = 0.0
	var x_velocity: float
	var y_velocity: float
	var time: int = 0
	var time_step: float = 0.02
	
	# Define constants
	const Y_ACCELERATION: float = 9.81
	const X_ACCELERATION: float = 0.0
	
	# Calculate initial velocities
	
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
