extends BehaviourTreeBase


var children: Array = []

func _init():
	var childerns_array: Array = [
		preload("res://components/enemy_ai/patrol.gd").new(),				
		preload("res://components/enemy_ai/player_near_by.gd").new(),		
		preload("res://components/enemy_ai/attack.gd").new()
	]
	children.append_array(childerns_array)

func tick(
	delta: float,
	blackboard: Blackboard,
	result: BehaviourTreeResults
	):
	for child in children:
		var _state = child.tick(
			delta,
			blackboard,
			result
		)
		if _state != state.SUCCESS:
			return _state
	return state.SUCCESS
