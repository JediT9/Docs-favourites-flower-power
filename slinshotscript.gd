extends Sprite2D
# tutorial: https://www.youtube.com/watch?v=Azsw4NSc86w

enum flight_states{
	idle,
	pulling,
	flying,
	reset,
}

var player_state

# Called when the node enters the scene tree for the first time.
func _ready():
	player_state = flight_states.idle 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match flight_states:
		player_state.idle:
			pass
		player_state.pulling:
			if Input.is_action_pressed("left_click"):
				var mouse_position = get_global_mouse_position()
		player_state.flying:
			pass
		player_state.reset:
			pass

func _on_area_2d_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
