class_name BehaviourTree
extends BehaviourTreeBase

var root_node
# Called when the node enters the scene tree for the first time.


func _get_children():
	var childrens = get_children()
	return childrens
	
	

func tick(
	delta: float,
	blackboard: Blackboard,
	result: BehaviourTreeResults
):
	var childrens = _get_children()
	for child in childrens:
		child.tick(delta, blackboard, result)
		if !result.is_failed():
			break
