extends Sprite2D

var information
var time_elapsed = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	information = get_parent().get_values()
	time_elapsed += delta
	position.y = information[0][1] + information[1] * sin(time_elapsed)
