extends Node2D

# Export the laser's movement value
@export var laser_movement: int = 0
@export var is_timer: bool = false
@export var level_time: int = 0
var time: float = 0
var velocity: float


# Called when the laser enters the scene tree
func _ready():
	# Check if the laser is the timer
	if is_timer == true:
		var target: Node2D = get_tree().root.get_children()[1].get_children()[1]
		velocity = (target.position.x) / level_time
		var area: Area2D = get_children()[0]
		area.collision_layer = 2
		area.collision_mask = 2


# Called when the character enters the laser
func _on_laser_area_area_entered(_area: Node2D) -> void:
	# Set the previous scene to the current level
	PrevScene.previous_scene = get_tree().current_scene.scene_file_path
	PrevScene.death_counter += 1

	# Change to the death screen
	get_tree().change_scene_to_file("res://Death page.tscn")


# Make the laser move
func _physics_process(delta) -> void:
	# Check if the laser moves or is a timer
	if laser_movement != 0 and is_timer == false:
		time += delta
		# Set the new y-position
		position.y += laser_movement * cos(time) * delta
	elif is_timer == true:
		time += delta
		# Set the new x-position
		position.x += velocity * delta
