class_name BehaviourTreeBase
extends Node



enum state {
	SUCCESS,
	FAILURE,
	RUNNING
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func tick(delta: float, blackboard: Blackboard, result: BehaviourTreeResults):
	pass
