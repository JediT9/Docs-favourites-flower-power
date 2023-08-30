extends Sprite2D

var central_position: Array[float]
var movement_range: int
var time_elapsed: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta
	position.y = central_position[1] + movement_range*sin(time_elapsed)
