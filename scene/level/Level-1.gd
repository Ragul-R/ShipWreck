extends Node2D
@onready var player = $Player
@onready var healthbar = $UI/Healthbar

# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar._init_health(player.health)


func _physics_process(delta):
	pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null:
		if healthbar.health != player.health:
			healthbar.health = player.health
	elif healthbar != null:
		healthbar.health = 0
