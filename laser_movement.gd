extends Sprite2D


var information
var time_elapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	information = get_parent().get_values()
	print(information)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta
	position.y = information[0][1] + information[1]*sin(time_elapsed)
