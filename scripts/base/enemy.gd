class_name Enemy
extends Playable

@export var attraction_force: float = 40.0
var chase_player: bool = false

func manage_attack():
	pass

func on_attack_range():
	print("Attack Range")
	
func move_towards_player(
		global_position: Vector2,
		player: CharacterBody2D,
		rotation: float,		
		delta: float
	) -> Dictionary:
	var direction = global_position.direction_to(player.global_position)
	var distance = global_position.distance_to(player.global_position)

	var attraction_velocity = direction * attraction_force
	global_position += attraction_velocity * delta 
	rotation = direction.angle()
	
	return {
		"global_position": global_position, 
		"rotation": rotation
	}


func _set_chase_player(is_chasing):
	chase_player = is_chasing
