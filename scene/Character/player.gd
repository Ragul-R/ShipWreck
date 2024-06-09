extends CharacterBody2D

var speed = 50  # move speed in pixels/sec
var rotation_speed = 1.5  # turning speed in radians/sec
var time = 0
var hooked: bool = false
var radius
var anchor_point
var angle

func _physics_process(delta):
	if not hooked:
	#var move_input = Input.get_axis("down", "up")
		var rotation_direction = Input.get_axis("left", "right")
		velocity = velocity.lerp(transform.x * 1 * speed, 0.05)
		rotation += rotation_direction * rotation_speed * delta
	else:
		#var radius = global_position - hook_position
		#var angle = acos(radius.dot(velocity) / (radius.length() * velocity.length()))
		#var rad_vel = cos(angle) * velocity.length()
		#velocity += radius.normalized() * -rad_vel
		#velocity += (hook_position - global_position).normalized() * 15000 * delta
		#velocity *= 0.975
		time += delta
		var rotation = Vector2(cos(angle), sin(angle))
		position = rotation * radius + anchor_point
		angle = speed * time
	move_and_slide()


func _on_chain_hooked(dist, pos):
	hooked = true
	speed = 1
	time = 0
	radius = dist
	anchor_point = pos


func _on_chain_un_hooked():
	time = 0
	speed = 50
	hooked = false
