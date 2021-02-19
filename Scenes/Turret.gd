extends StaticBody2D

onready var ray = $RayCast2D
var Bullet = preload("res://Scenes/Bullet.tscn")
onready var player = get_parent().get_node("Player")
var seesPlayer
var _timer = null
func _ready():
	_timer = Timer.new()
	add_child(_timer)
	
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(0.05)
	_timer.set_one_shot(false)
	_timer.start()

func _process(delta):
	pass


func _physics_process(delta):
	ray.cast_to = player.global_position - global_position
	ray.force_raycast_update()
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider.is_in_group('player'):
			seesPlayer = true
		else:
			seesPlayer = false
			
			
func fire():
	var bulletInstance = Bullet.instance()
	add_child(bulletInstance)


func _on_Timer_timeout():
	if seesPlayer == true:
		fire()
	else:
		pass
