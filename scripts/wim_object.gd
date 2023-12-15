extends RigidBody3D
var previous_transform: Transform3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var hover_left = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var large_object_path = "../../Big World/Big %s" % self.name
	var large_object = get_node(large_object_path)
	large_object.transform = self.transform
	large_object.position = self.position * 20
	var mesh = self.get_node("MeshInstance3D")
	var shape = self.get_node("CollisionShape3D")
	var large_mesh = large_object.get_node("MeshInstance3D")
	var large_shape = large_object.get_node("CollisionShape3D")
	large_mesh.rotation = mesh.rotation
	large_shape.rotation = shape.rotation
	if mesh.scale > Vector3(2, 2, 2):
		mesh.scale = Vector3(2, 2, 2)
	if shape.scale > Vector3(2, 2, 2):
		shape.scale = Vector3(2, 2, 2)
	large_mesh.scale = mesh.scale * 20
	large_shape.scale = shape.scale * 20
	
