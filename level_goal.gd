extends Node2D


# End the game as a victory, called when the character touches the end goal
func _on_goal_area_area_entered(area) -> void:
	# Change the scene
	get_tree().change_scene_to_file("res://Victory page.tscn")
