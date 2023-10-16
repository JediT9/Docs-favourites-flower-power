extends Sprite2D

const image_height: float = 794
const image_width: float = 1123

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# center on the screen
	position.y = DisplayServer.window_get_size()[1] / 2.0
	position.x = DisplayServer.window_get_size()[0] / 2.0
	scale.x = (DisplayServer.window_get_size()[0]) / image_width
	scale.y = (DisplayServer.window_get_size()[1]) / image_height
	


func _on_tutorial_button_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("left_click"):
		pass   # Change level
