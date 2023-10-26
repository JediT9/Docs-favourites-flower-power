extends Sprite2D

# Set the image sizes
const image_height: float = 794
const image_width: float = 1123


# Called when the node enters the scene tree for the first time.
func _ready():
	# Center the sprite on the screen
	position.y = DisplayServer.window_get_size()[1] / 2.0
	position.x = DisplayServer.window_get_size()[0] / 2.0
	scale.x = (DisplayServer.window_get_size()[0]) / image_width
	scale.y = (DisplayServer.window_get_size()[1]) / image_height


# Called when the return home button is pressed on the victory screen
func _on_return_home_area_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		# Change the scene to the victory screen
		get_tree().change_scene_to_file("res://Scenes/Landing page.tscn")
