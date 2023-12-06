extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var hover_left = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x >= 0.25:
		hover_left = false

	if position.x < -0.25:
		hover_left = true

	if hover_left:
		position.x += (0.01)

	else:
		position.x -= (0.01)
		
	var large_object_path = "../../Big World/Big %s" % self.name
	var large_object = get_node(large_object_path)
	large_object.position = self.position * 20
	large_object.scale = self.scale
	pass
