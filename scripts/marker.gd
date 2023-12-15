extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var L = $"../../XRUser/XROrigin3D/LeftController"
	var R = $"../../XRUser/XROrigin3D/RightController"
	var x_pos = ((L.global_position.x + R.global_position.x) / 2)
	var y_pos = ((L.global_position.y + R.global_position.y) / 2)
	var z_pos = ((L.global_position.z + R.global_position.z) / 2)
	get_parent().global_position = (Vector3(x_pos, y_pos, z_pos))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var L = $"../../XRUser/XROrigin3D/LeftController"
	var R = $"../../XRUser/XROrigin3D/RightController"
	var x_pos = ((L.global_position.x + R.global_position.x) / 2)
	var y_pos = ((L.global_position.y + R.global_position.y) / 2)
	var z_pos = ((L.global_position.z + R.global_position.z) / 2)
	get_parent().global_position = (Vector3(x_pos, y_pos, z_pos))
