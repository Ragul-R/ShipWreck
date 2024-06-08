class_name BehaviourTreeResults
extends Node


enum Result {
	SUCESS,
	FAILURE,
	RUNNING
}

var result: int = Result.FAILURE
var running_node: Node

func set_success() -> void:
	result = Result.SUCESS
	running_node = null
	
func set_failure() -> void:
	result = Result.FAILURE
	running_node = null
	
func set_running(n: Node) -> void:
	result = Result.RUNNING
	running_node = n

func is_succeeded() -> bool:
	return result == Result.SUCESS
	

func is_failed() -> bool:
	return result == Result.FAILURE


func is_running() -> bool:
	return result == Result.RUNNING


