class_name Bullet
extends Area2D

@export var speed := 500.0
@export var max_distance := 1000.0
@export var damage := 10

var direction := Vector2.RIGHT
var start_position := Vector2.ZERO

func _ready():
	start_position = global_position

func _physics_process(delta):
	var distance_traveled = global_position.distance_to(start_position)
	if distance_traveled >= max_distance:
		queue_free()
	else:
		global_position += direction * speed * delta


func set_direction(new_direction: Vector2):
	direction = new_direction.normalized()

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()
