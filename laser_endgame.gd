extends Node2D

# Export the laser's movement value
@export var laser_movement: int = 0
var time: float = 0

func _on_laser_area_area_entered(area: Node2D):
	get_tree().quit()
	
# Make the laser move
func _physics_process(delta):
	if laser_movement != 0:
		time += delta
		position.y += laser_movement * cos(time) * delta
