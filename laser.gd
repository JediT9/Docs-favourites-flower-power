class_name laser extends Sprite2D

# Initiate variable
var centralPosition: Array
var moving: bool
var size: Array
var movementRange: int = 0
var timeElapsed: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = centralPosition[0]
	position.y = centralPosition[1]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeElapsed += delta
	position.y += movementRange*sin(timeElapsed)*delta


func _on_laser_area_area_entered(area):
	pass # Will end the game
