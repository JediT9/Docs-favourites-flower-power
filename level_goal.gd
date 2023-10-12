extends Node2D


# End the game as a victory, called when the character touches the end goal
func _on_goal_area_area_entered(area) -> void:
	print("Congratulations! You won!")
	get_tree().quit()
