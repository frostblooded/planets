class_name CameraGimble
extends Node3D

@export var look_at_target: Node3D

func _process(delta: float) -> void:
	var input: Vector2 = Input.get_vector("camera_left", "camera_right", "camera_down", "camera_up")
	rotate_object_local(Vector3.UP, input.x * delta)
	rotate_object_local(Vector3.LEFT, input.y * delta)

	if look_at_target:
		look_at(look_at_target.global_transform.origin, Vector3.UP)
