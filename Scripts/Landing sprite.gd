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


# Called when the tutorial button is pressed
func _on_tutorial_button_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		# Change the scene
		get_tree().change_scene_to_file("res://Scenes/Tutorial level.tscn")


# Called when the level 1 button is pressed
func _on_level_1_button_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		# Change the scene
		get_tree().change_scene_to_file("res://Scenes/Level 1.tscn")


# Called when the level 2 button is pressed
func _on_level_2_button_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		# Change the scene
		get_tree().change_scene_to_file("res://Scenes/Level 2.tscn")


# Called when the level 3 button is pressed
func _on_level_3_button_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		# Change the scene
		get_tree().change_scene_to_file("res://Scenes/Level 3.tscn")


# Called when the level 4 button is pressed
func _on_level_4_button_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		# Change the scene
		get_tree().change_scene_to_file("res://Scenes/Level 4.tscn")


# Called when the level 5 button is pressed
func _on_level_5_button_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		# Change the scene
		get_tree().change_scene_to_file("res://Scenes/Level 5.tscn")
