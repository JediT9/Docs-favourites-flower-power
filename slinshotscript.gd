extends Sprite2D
# tutorial: https://www.youtube.com/watch?v=Azsw4NSc86w

enum flight_states{
	idle,
	pulling,
	flying,
	reset,
}
var line: Line2D
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
				line.visible = true
				var mouse_position = get_global_mouse_position()
				var line_end_pos: Vector2 = Vector2(mouse_position[0] - position.x, mouse_position[1] - position.y)
				line.points[1] = line_end_pos
			else:
				line.visible = false
				player_state = flight_states.idle
		flight_states.flying:
			pass
		flight_states.reset:
			pass

func _on_area_2d_input_event(viewport, event, shape_idx):
	player_state = flight_states.pulling
