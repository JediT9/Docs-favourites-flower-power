extends Node2D

var character: Node2D
var character_area: CharacterBody2D
var character_click_area: Area2D

# Define constants
const RIGHT_LEVEL_END: int = 2800
const LEFT_LEVEL_END: int = -100


# Called when the node enters the scene tree
func _ready():
	character = $character_throw

	# Move the character to layer two so it doesn't collide with lasers
	character_area = $character_throw/CharacterBody2D
	character_click_area = $character_throw/CharacterBody2D/Area2D
	character_area.collision_layer = 0b100
	character_click_area.collision_layer = 0b100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Check if the user pressed enter, if so change to landing page
	if Input.is_action_just_released("enter"):
		get_tree().change_scene_to_file("res://Scenes/Landing page.tscn")

	# Check that the character is within the boundaries, if not move them back within the boundaries
	if (character.position.x + character.get_child(0).position.x) > RIGHT_LEVEL_END:
		character.get_child(0).position.x = RIGHT_LEVEL_END - character.position.x
	if (character.position.x + character.get_child(0).position.x) < LEFT_LEVEL_END:
		character.get_child(0).position.x = LEFT_LEVEL_END - character.position.x
