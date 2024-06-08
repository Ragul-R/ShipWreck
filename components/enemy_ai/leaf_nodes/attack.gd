extends BehaviourTreeBase

var rng = RandomNumberGenerator.new()

signal process_attack_player

func tick(
	delta: float,
	blackboard: Blackboard,
	resutl: BehaviourTreeResults
):
	#var my_random_number = rng.randf_range(-10.0, 10.0)
	#if my_random_number > 0:
		#resutl.set_success()
	emit_signal("process_attack_player")
	resutl.set_success()
