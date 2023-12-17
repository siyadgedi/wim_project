extends Node3D

var grabbed_object: RigidBody3D = null
var previous_transform: Transform3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var controller_distance = 1
var curr_obj_scale = Vector3(1, 1, 1)
var curr_shape_scale = Vector3(1, 1, 1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var spindle = $"../Spindle"
	# Copy the grabber's relative movement since the last frame to to the grabbed object
	if self.grabbed_object:
		var left = $"../XRUser/XROrigin3D/LeftController"
		var right = $"../XRUser/XROrigin3D/RightController"
		var curr_controller_distance = left.position.distance_to(right.position)
		var object_scale = curr_controller_distance / controller_distance
		var obj = self.grabbed_object.get_node("MeshInstance3D")
		var shape = self.grabbed_object.get_node("CollisionShape3D")
		if(self.grabbed_object.name != "Rotate_World"):
			obj.scale = Vector3(object_scale * curr_obj_scale.x, object_scale * curr_obj_scale.y, object_scale * curr_obj_scale.z)
			shape.scale = Vector3(object_scale * curr_shape_scale.x, object_scale * curr_shape_scale.y, object_scale * curr_shape_scale.z)
		if(self.grabbed_object.name == "Rotate_World"):
			print("entered check")
			print(spindle.rotation.x)
			print(spindle.rotation.y)
			print(spindle.rotation.z)
			if(deg_to_rad(-45)<spindle.rotation.x && spindle.rotation.x<deg_to_rad(45)):
				obj.rotation.x = spindle.rotation.x
				shape.rotation.x = spindle.rotation.x
				
			if(deg_to_rad(-45)<spindle.rotation.z && spindle.rotation.z<deg_to_rad(45)):
				obj.rotation.z = spindle.rotation.z
				shape.rotation.z = spindle.rotation.z
			obj.rotation.y = spindle.rotation.y
			shape.rotation.y = spindle.rotation.y			
		else:
			obj.rotation = spindle.rotation
			shape.rotation = spindle.rotation
		if(self.grabbed_object.name != "Rotate_World"):
			self.grabbed_object.transform = self.global_transform * self.previous_transform.affine_inverse() * self.grabbed_object.transform
	self.previous_transform = self.transform
	

func _on_button_pressed(button_name: String) -> void:
	print("button pressed: " + button_name)
	
	# Stop if we have not clicked the grip button or we already are grabbing an object
	if button_name != "grip_click" || self.grabbed_object != null:
		return
	
	var grabbables = get_tree().get_nodes_in_group("grabbable")
	var collision_area = $Area3D as Area3D

	# Iterate through all grabbable objects and check if the collision area overlaps with them
	for grabbable in grabbables:

		# Cast the grabbable object to a RigidBody3D
		var grabbable_body = grabbable as RigidBody3D

		# Check to see if the grabber and grabbable collision shapes are intersecting
		if collision_area.overlaps_body(grabbable_body):
	
			# If the object is already grabbed by another grabber, release it first
			var globals = get_node("/root/Globals")
			for grabber in globals.active_grabbers:
				if grabber.grabbed_object == grabbable_body:
					grabber.grabbed_object = null
					globals.active_grabbers.remove_at(globals.active_grabbers.find(self))
					break

			# Freeze the object physics and then grab it
			grabbable_body.freeze = true
			self.grabbed_object = grabbable_body
			globals.active_grabbers.push_back(self)
			var left = $"../XRUser/XROrigin3D/LeftController"
			var right = $"../XRUser/XROrigin3D/RightController"
			controller_distance = left.position.distance_to(right.position)
			var obj = self.grabbed_object.get_node("MeshInstance3D")
			var shape = self.grabbed_object.get_node("CollisionShape3D")
			curr_obj_scale = obj.scale
			curr_shape_scale = shape.scale
	
func _on_button_released(button_name: String) -> void:
	print("button released: " + button_name)
	
	# Stop if we have not clicked the grip button or we have no current grabbed object
	if button_name != "grip_click" || self.grabbed_object == null:
		return

	# Release the grabbed object and unfreeze it
	if(self.grabbed_object.name != "Rotate_World"):
		self.grabbed_object.freeze = false
	self.grabbed_object.linear_velocity = Vector3(0, -0.1, 0)
	self.grabbed_object.angular_velocity = Vector3.ZERO
	self.grabbed_object = null

	# Remove this grabber from the array of active grabbers
	var globals = get_node("/root/Globals")
	globals.active_grabbers.remove_at(globals.active_grabbers.find(self))


func _on_right_controller_button_pressed(_name):
	pass # Replace with function body.


func _on_left_controller_button_pressed(_name):
	pass # Replace with function body.
	

