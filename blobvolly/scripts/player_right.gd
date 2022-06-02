extends KinematicBody2D

export (float, 0, 1000)var speed = 500;
export (float, 0, 1) var friction = 0.5;
export (float, -3000, 0) var jump_speed  = -2000;
export (float, 0, 5000) var gravity = 4000;
export (float, 0, 1) var acceleration = 0.6;
#export (int, 0, 200) var inertia = 800;

var velocity = Vector2.ZERO;

func _get_input(): 
	var dir = 0;
	if Input.is_action_pressed("move_right_right"): 
		dir += 1 
	if Input.is_action_pressed("move_left_right"): 
		dir -= 1 
	if dir != 0: 
		velocity.x = lerp(velocity.x, dir * speed, acceleration) 
	else: 
		velocity.x = lerp(velocity.x, 0, friction)

func _ready():
	pass

func _process(delta):
	_get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
	#	if collision.collider.is_in_group("Ball"):
	#		collision.collider.apply_central_impulse(-collision.normal * inertia)
	
	
	if Input.is_action_pressed("jump_right"):
		if is_on_floor():
			velocity.y = jump_speed
