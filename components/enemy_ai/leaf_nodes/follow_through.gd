extends BehaviourTreeBase

var direction = 0

signal move_towards_player

func tick(
	delta: float,
	blackboard: Blackboard,
	result: BehaviourTreeResults
) -> void:
	var is_on_follow_through_range = blackboard.data.get("is_on_follow_through_range")
	if is_on_follow_through_range:
		emit_signal("move_towards_player")
		result.set_success()
		return
	result.set_failure()
	


