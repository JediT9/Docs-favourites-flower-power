extends Sprite2D

# Set the image scale and position
const X_SCALE: float = 0.89047193527222
const Y_SCALE: float = 0.81612092256546
const Y_POSITION: float = 324
const X_POSITION: float = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	# Center the image on the screen
	position.y = Y_POSITION
	position.x = X_POSITION
	scale.x = X_SCALE
	scale.y = Y_SCALE


# Called when the return home button is pressed on the victory screen
func _on_return_home_area_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		# Change the scene to the victory screen
		get_tree().change_scene_to_file("res://Scenes/Landing page.tscn")
