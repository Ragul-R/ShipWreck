extends ProgressBar

@onready var damagebar = $Damagebar
@onready var timer = $Timer

var health: int = 0 : set = _set_health

func _init_health(_health: int):
	health = _health
	max_value = health
	value = health
	damagebar.value = health
	damagebar.max_value = health

func _set_health(new_hp: int):
	var prev_health = health
	health = clamp(new_hp, 0, max_value)
	value = health
	
	if health <= 0:
		queue_free()
	
	if health < prev_health:
		timer.start()
	else:
		damagebar.value = health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	damagebar.value = health
