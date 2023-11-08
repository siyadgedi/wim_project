extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var hover_up = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if position.y >= 2.5:
		hover_up = false
	
	if position.y < 1.2:
		hover_up = true
	
	if hover_up:
		position.y += (delta/2.5)
		
	else:
		position.y -= (delta/2.5)
	
