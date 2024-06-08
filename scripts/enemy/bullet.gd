class_name Bullet
extends Area2D

@export var initial_speed := 500.0
@export var max_distance := 500.0
@export var damage := 10

var direction := Vector2.RIGHT
var start_position := Vector2.ZERO
var speed: float
var remaining_distance := max_distance

func _ready():
	start_position = global_position

func _physics_process(delta):
	var distance_traveled = global_position.distance_to(start_position)
	remaining_distance = max_distance - distance_traveled

	if int(remaining_distance) <= 50:
		queue_free()		
	elif int(remaining_distance) <= 100:
		global_position += direction * speed * delta		
	else:
		speed = initial_speed * (remaining_distance / max_distance)
		global_position += direction * speed * delta


func set_direction(new_direction: Vector2):
	direction = new_direction.normalized()

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()
