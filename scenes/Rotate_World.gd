extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var WIM = get_node("../WIM/Ground")
	var Big = get_node("../Big World/Ground")
	var Barrier = get_node("../WIM/Barrier")
	var mesh = get_node("MeshInstance3D")
	WIM.rotation = mesh.rotation
	Big.rotation = mesh.rotation
	Barrier.rotation = mesh.rotation
