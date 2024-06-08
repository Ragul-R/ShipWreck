extends CharacterBody2D

var speed = 450  # move speed in pixels/sec
var rotation_speed = 1.5  # turning speed in radians/sec

func _physics_process(delta):
	var move_input = Input.get_axis("down", "up")
	var rotation_direction = Input.get_axis("left", "right")
	velocity = velocity.lerp(transform.x * move_input * speed, 0.05)
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
