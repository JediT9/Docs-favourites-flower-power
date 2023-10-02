extends Sprite2D

var score : int = 0
var speed : int = 2
var jumpForce : int = 600
var gravity : int = 800
var vel : Vector2 = Vector2()
@onready
var sprite : Sprite2D = $Sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	vel.x = 0
  #movement inputs
	if Input.is_action_pressed("move_left"):
		position.x -= speed
	if Input.is_action_pressed("move_right"):
		position.x += speed
