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
var path_calc_class = load("res://path calc final.gd")
var path_operator: projectile_path_calc = null
var intended_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	player_state = flight_states.idle 
	line = $Line2D
	position = Vector2(100, 500)
	intended_position = position

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
			elif Input.is_action_just_released("left_click"):
				print("hi")
				var speed: float = sqrt(pow(line.points[1][0], 2) + pow(line.points[1][1], 2))
				var angle: float = atan(line.points[1][1]/line.points[1][0])
				path_operator = path_calc_class.new(speed, angle, position.x, position.y)
			else:
				line.visible = false
				player_state = flight_states.idle
		flight_states.flying:
			pass
		flight_states.reset:
			pass
	
	# Move the character
	if path_operator != null:
		if position == intended_position:   # If the sprite hasn't been teleported by a worldborder
			position = path_operator.calc_positions(delta)
			intended_position = position
		else:
			path_operator = null

func _on_area_2d_input_event(viewport, event, shape_idx):
	player_state = flight_states.pulling
