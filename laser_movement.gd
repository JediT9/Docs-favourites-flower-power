extends Sprite2D

var information = null
var time_elapsed = 0


func _ready():
	information = get_parent().get_values()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta
	position.y = information[0][1] + information[1] * sin(time_elapsed)
