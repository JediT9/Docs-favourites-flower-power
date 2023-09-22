extends Sprite2D
# tutorial: https://www.youtube.com/watch?v=Azsw4NSc86w

enum flight_states{
	idle,
	pulling,
	flying,
	reset,
}
var line
var player_state

# Called when the node enters the scene tree for the first time.
func _ready():
	player_state = flight_states.idle 
	line = $Line2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match player_state:
		flight_states.idle:
			pass
		flight_states.pulling:
			if Input.is_action_pressed("left_click"):
				var mouse_position = get_global_mouse_position()
				print(mouse_position)
				line.points[1] = mouse_position
		flight_states.flying:
			pass
		flight_states.reset:
			pass

func _on_area_2d_input_event(viewport, event, shape_idx):
	player_state = flight_states.pulling
