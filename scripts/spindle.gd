extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var L = $"../XRUser/XROrigin3D/LeftController"
	var R = $"../XRUser/XROrigin3D/RightController"
	var marker = $"../Marker/MarkerMesh"
	look_at_from_position(Vector3(marker.global_position.x, marker.global_position.y, marker.global_position.z), R.global_position)
	self.scale = Vector3(self.scale.x, self.scale.y, L.position.distance_to(R.position))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var L = $"../XRUser/XROrigin3D/LeftController"
	var R = $"../XRUser/XROrigin3D/RightController"
	var marker = $"../Marker/MarkerMesh"
	look_at_from_position(Vector3(marker.global_position.x, marker.global_position.y, marker.global_position.z), R.global_position)
	self.scale = Vector3(self.scale.x, self.scale.y, L.position.distance_to(R.position))
