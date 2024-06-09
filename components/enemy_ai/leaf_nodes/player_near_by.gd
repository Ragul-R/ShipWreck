extends BehaviourTreeBase

var direction = 0


func is_player_near_by(ray_cast: RayCast2D) -> bool:
	if ray_cast.is_colliding() and (ray_cast.get_collider() is CharacterBody2D):
		return true
	return false


func tick(
	delta: float,
	blackboard: Blackboard,
	result: BehaviourTreeResults
) -> void:
	var is_on_attack_range = blackboard.data.get("is_on_attack_range")
	if is_on_attack_range:
		result.set_success()
		return
	result.set_failure()
	


