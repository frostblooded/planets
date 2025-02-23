class_name CameraGimble
extends Node3D

@export var look_at_target: Node3D
@export var follow_target: Node3D

var initial_offset: Vector3

func _ready() -> void:
	initial_offset = global_position

func _process(_delta: float) -> void:
	if look_at_target:
		look_at(look_at_target.global_transform.origin, Vector3.UP)
	
	if follow_target:
		global_position = follow_target.global_position + initial_offset

func _input(event: InputEvent) -> void:
	var input_event_mouse_motion: InputEventMouseMotion = event as InputEventMouseMotion

	if input_event_mouse_motion:
		var move_strenght: float = 0.01
		rotate_object_local(Vector3(1, 0, 0), - input_event_mouse_motion.relative.y * move_strenght)
		global_rotate(Vector3(0, 1, 0), - input_event_mouse_motion.relative.x * move_strenght)
