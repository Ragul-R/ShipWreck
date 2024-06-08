extends Node2D

const SPEED = 60

var direction = -1


@export var behaviour_ai: BehaviourTree


var result: BehaviourTreeResults
var blackboard: Blackboard

#@onready var ray_cast_right = $RayCastRight
#@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@onready var enemy: Enemy = Enemy.new()
const BULLET: PackedScene = preload("res://scene/enemy/bullet.tscn")


@onready var player: CharacterBody2D

@export var follow_offset: Vector2 = Vector2(100, 100)
@export var smoothing_factor: float = 0.5

@export var attraction_force: float = 40.0

var ray_cast: RayCast2D



# Called when the node enters the scene tree for the first time.
func _ready():
	result = BehaviourTreeResults.new()
	blackboard = Blackboard.new()
	ray_cast = RayCast2D.new()
	ray_cast.enabled = true
	ray_cast.exclude_parent = true
	ray_cast.collide_with_areas = true
	ray_cast.collide_with_bodies = true
	ray_cast.target_position = Vector2(-50, 0)
	add_child(ray_cast)
	blackboard.data["parent_node"] = self
	blackboard.data["is_on_attack_range"] = false
	blackboard.data["is_on_follow_through_range"] = false
	
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if player:
		#var direction = player.global_position - global_position
		#rotation = direction.angle()
		#print("dir ", direction)
		
	if player:
		var movement_details = enemy.move_towards_player(
			global_position,
			player,
			rotation,
			delta
		)
		global_position = movement_details.get("global_position")
		rotation = movement_details.get("rotation")
		
		
		
			

	

	behaviour_ai.tick(
		delta,
		blackboard,
		result
	)
	
	#if ray_cast_right.is_colliding():
		#direction = -1
		#animated_sprite.flip_h = true
	#if ray_cast_left.is_colliding():
		#direction = 1
		#animated_sprite.flip_h = false
		#
				#
	#position.x +=  ( direction * SPEED * delta)



func _on_attack_process_attack_player():
	print("Attackign Player")
	var direction = global_position.direction_to(player.global_position)
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = global_position
	new_bullet.direction = direction
	get_tree().current_scene.add_child(new_bullet)
	enemy.manage_attack()



func _on_patrol_movement_progresser():
	enemy.manage_movement()



func _on_patroling_zone_body_entered(body):
	blackboard.data["is_on_attack_range"] = true
	

func _on_patroling_zone_body_exited(body):
	blackboard.data["is_on_attack_range"] = false
	


func _on_follow_through_zone_body_entered(body):
	player = body	
	blackboard.data["is_on_follow_through_range"] = true
	
	pass # Replace with function body.


func _on_follow_through_zone_body_exited(body):
	player = null		
	blackboard.data["is_on_follow_through_range"] = false
	pass


func _on_is_follow_through_move_towards_player():
	
	pass
	
	
