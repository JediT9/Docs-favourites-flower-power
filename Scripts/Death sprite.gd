extends Sprite2D

# Set the image sizes
const image_height: float = 794
const image_width: float = 1123


# Called when the node enters the scene tree for the first time.
func _ready():
	# Center the image on the screen
	position.y = DisplayServer.window_get_size()[1] / 2.0
	position.x = DisplayServer.window_get_size()[0] / 2.0
	scale.x = (DisplayServer.window_get_size()[0]) / image_width
	scale.y = (DisplayServer.window_get_size()[1]) / image_height

	# Set the death counter
	var death_label: RichTextLabel = $"Death counter"
	death_label.text = ""
	death_label.push_color("yellow")
	death_label.add_text("Deaths: " + str(PrevScene.death_counter))


# Called when the death screen return home button is pressed
func _on_return_home_area_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		# Change the current scene
		get_tree().change_scene_to_file("res://Scenes/Landing page.tscn")


# Called when the death screen restart button is pressed
func _on_restart_area_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		# Change the current scene
		get_tree().change_scene_to_file(PrevScene.previous_scene)
