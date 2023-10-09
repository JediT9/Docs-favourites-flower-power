extends Node2D

# End the game as a victory
func _on_goal_area_area_entered(area):
	print("Congratulations! You won!")
	get_tree().quit()
