extends Area2D

var speed : Vector2 = Vector2(10,10)
var gravitation : Vector2 = Vector2(0, 5)

func _ready():
	pass # Replace with function body.

func _process(delta):
	position += speed
	position += gravitation
	check_bodies()

func check_bodies():
	
	if get_overlapping_bodies().size() != 0:
		speed *= -1
		#print(speed)
