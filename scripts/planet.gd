class_name Planet
extends RigidBody3D

@export var initial_velocity: Vector3 = Vector3.ZERO

func _ready() -> void:
	linear_velocity = initial_velocity

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var G: float = 9.8
	var attraction: Vector3 = Vector3.ZERO

	var planets: Array[Node] = get_tree().get_nodes_in_group("planets")

	for planet_node: Node in planets:
		if planet_node == self:
			continue

		var planet: Planet = planet_node as Planet
		var distance_sq: float = global_position.distance_squared_to(planet.global_position)
		var attraction_strength: float = G * (mass * planet.mass) / distance_sq
		var direction: Vector3 = global_position.direction_to(planet.global_position)
		attraction += direction * attraction_strength
	
	var normalized_attraction: Vector3 = attraction.normalized()
	state.linear_velocity += normalized_attraction
