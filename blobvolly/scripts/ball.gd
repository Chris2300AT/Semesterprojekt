extends KinematicBody2D
"""
export var score_control_node_path : NodePath

onready var score_control_node : Node = get_node(score_control_node_path)

var speed = 2
var direction = Vector2(1, 1)
var gravity = 700
var x = 1
var y = 1
var time = 0
var frictionX = 0.0015
var frictionY = 0.0015
var collitonx;
var collitony;
"""

func _ready():
	pass
	

func _physics_process(delta): #Leuft im loop 60*s
	"""score_control_node.new_start();
	time += delta 
	var collision_info = move_and_collide((direction) * speed * delta) #wenn der BAll kolidiert boolien true
	Engine.time_scale = 0.7
	if collision_info:
		if collision_info.collider.is_in_group("floor"):
			add_score(collision_info.collider)
		direction = direction.bounce(collision_info.normal)
		if collision_info.collider.is_in_group("players"): #Nur wenn er einen Spieler Berührt
			
			
			collitonx = collision_info.collider_velocity.x
			collitony = collision_info.collider_velocity.y
			print(100)
			position += Vector2(collitonx, collitony) * delta #spieler Geschwindigkeit dplus konstante
			collision_info.collider_velocity.normalized() * 3
			direction = direction + move_and_slide(collision_info.collider_velocity.normalized() * 90 * delta)
			time = 0
	
	if (time <= 0.5):
		speed = 2.5 + (1 - 2) * time * 2 #um nicht zwei mal hintereinander zu viel speed aufbauen zu können
	
		
	#speed = lerp(speed, 0, frictionX) 
	
	if Input.is_action_just_pressed("addpoint"):
		score_control_node.add_score(true)
	
	
	direction.y += gravity * delta #die Gravitation wird hinzugefügt
	
	direction.x = lerp(direction.x, 0, frictionX)
	direction.y = lerp(direction.y, 0, frictionY)
	#var isonfloor = _

func add_score(collider : Object):
	
	speed = 0
	direction.x = 0
	direction.y = 0
	
	if collider.is_in_group("left_floor"):
		position = Vector2(1400, 400)
		score_control_node.add_score(false)
	else:
		position = Vector2(700, 400)
		score_control_node.add_score(true)"""

	
