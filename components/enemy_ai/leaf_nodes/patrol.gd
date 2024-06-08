extends BehaviourTreeBase

var rng = RandomNumberGenerator.new()
var direction = -1

signal movement_progresser


func tick(
	delta: float,
	blackboard: Blackboard,
	result: BehaviourTreeResults
):
	emit_signal("movement_progresser")
	result.set_success()


