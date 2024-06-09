extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var hit_flash_animation = $HitFlashAnimation

@export var health: int = 100 :
	set = _set_hp

var speed = 450  # move speed in pixels/sec
var rotation_speed = 1.5  # turning speed in radians/sec

func _set_hp(new_hp):
	if new_hp != health:
		health = clamp(new_hp, 0, 100)
		if health <= 50:
			sprite.play("half_hp")
		
		if health <= 20:
			sprite.play("low_hp")
		
		if health <= 0:
			queue_free()

func _ready():
	sprite.play("default")

func _physics_process(delta):
	var move_input = Input.get_axis("down", "up")
	var rotation_direction = Input.get_axis("left", "right")
	velocity = velocity.lerp(transform.x * move_input * speed, 0.05)
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()


func _on_hurt_box_area_entered(area: Area2D):
	if (area.is_in_group('Projectile')):
		health -= area.damage
		hit_flash_animation.play("hitflash")
