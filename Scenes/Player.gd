extends KinematicBody2D

var speed = 20
var data = 1
var motion = Vector2()
const cursorDist = 20
onready var cursor = get_node("Cursor")
var directions = {
	1:Vector2(0, cursorDist),
	2:Vector2(cursorDist, 0),
	3:Vector2(0, -cursorDist),
	4:Vector2(-cursorDist, 0)
}



func get_input():
	if Input.is_action_just_pressed("A"):
		data += 1
		if data > 4:
			data = 1
		$Cursor.position = directions[data]
	elif Input.is_action_pressed("spacebar"):
		motion = directions[data] * speed
	else:
		motion = Vector2(0,0)

func _physics_process(delta):
	get_input()
	move_and_slide(motion)

