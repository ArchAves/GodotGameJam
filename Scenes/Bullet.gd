extends StaticBody2D

var shootDir = Vector2()
var playerPos = Vector2()
var velocity = Vector2()
onready var player = get_parent().get_parent().get_node("Player")
var speed = 30
var direction := Vector2.ZERO

func _ready():
	playerPos = player.global_position - global_position
	shootDir = position.direction_to(playerPos)
	shootDir = shootDir.normalized()

func _physics_process(delta):
	position += shootDir * speed
	print(velocity)
	if not $VisibilityNotifier2D.is_on_screen():
		self.queue_free()
