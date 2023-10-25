extends Node2D


# Called when something hits the spike
func _on_spike_area_area_entered(_area: Node2D) -> void:
	# Set the previous scene to the current level
	PrevScene.previous_scene = get_tree().current_scene.scene_file_path
	PrevScene.death_counter += 1

	# Change to the death screen
	get_tree().change_scene_to_file("res://Death page.tscn")
