extends Node2D

func _on_spike_area_area_entered(area):
	print("end")
	get_tree().quit()
