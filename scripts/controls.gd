class_name Controls
extends Node

@export var camera: CameraGimble

var imgui_enabled: bool = false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused

	if Input.is_action_just_pressed("toggle_imgui"):
		imgui_enabled = !imgui_enabled

		if imgui_enabled:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			camera.mouse_input_enabled = false
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			camera.mouse_input_enabled = true

	if imgui_enabled:
		draw_imgui()

func draw_imgui() -> void:
	ImGui.Begin("ImGui")

	if ImGui.TreeNodeEx("Planets", ImGui.TreeNodeFlags_DefaultOpen):
		var planets: Array[Node] = get_tree().get_nodes_in_group("planets")

		for planet_node: Node in planets:
			var planet: Planet = planet_node as Planet
			ImGui.Text(planet.name)
			ImGui.SameLine()

			if ImGui.Button("Follow##" + str(planet.get_instance_id())):
				camera.follow_target = planet_node

		ImGui.TreePop()
	
	ImGui.End()
