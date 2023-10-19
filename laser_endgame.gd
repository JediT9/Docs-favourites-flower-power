extends Node2D

# Export the laser's movement value
@export var laser_movement: int = 0
@export var is_timer: bool = false
@export var level_time: int = 0
var time: float = 0


# Called when the laser enters the scene tree
func _ready():
	# Check if the laser is the timer
	if is_timer == true:
		pass

# Called when the character enters the laser
func _on_laser_area_area_entered(area: Node2D) -> void:
	
	# Set the previous scene to the current level
	PrevScene.previous_scene = get_tree().current_scene.scene_file_path
	
	# Change to the death screen
	get_tree().change_scene_to_file("res://Death page.tscn")

# Make the laser move
func _physics_process(delta) -> void:
	if laser_movement != 0 and is_timer == false:
		time += delta
		# Set the new y-position
		position.y += laser_movement * cos(time) * delta
