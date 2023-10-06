extends Node2D

# Called when something hits the spike
func _on_spike_area_area_entered(area):
	print("end")
	get_tree().quit()
