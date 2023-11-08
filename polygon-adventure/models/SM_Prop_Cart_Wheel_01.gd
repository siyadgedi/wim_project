extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var hover_left = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if position.x >= 7.5:
		hover_left = false

	if position.x < -7.5:
		hover_left = true

	if hover_left:
		position.x += (delta*2)

	else:
		position.x -= (delta*2)
