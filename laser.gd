extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 300


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 20 * float(delta)


func _on_area_2d_2_area_entered(area):
	print("collided")
	self.hide()
