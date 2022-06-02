extends RigidBody2D

export var score_control_node_path : NodePath
onready var score_control_node : Node = get_node(score_control_node_path)

var maxSpeed = 1200
var save_gravity_scale : float

func _ready():
	pass

func _process(delta):
	#score_control_node.new_start(false)

	if Input.is_action_pressed("addpoint"):
		score_control_node.add_score(true)
	
	if linear_velocity.length() > maxSpeed:
		linear_velocity = linear_velocity.normalized() * maxSpeed
	
func add_score(state : Object, collider : Object):
	
	var t = state.get_transform()
	
	linear_velocity = Vector2(0, 0) #Alle physik werte werden auf null gestellt
	angular_velocity = 0
	save_gravity_scale = gravity_scale
	gravity_scale = 0
	
	if collider.is_in_group("left_floor"):
		t.origin.x = 1400 #zurück Setzung des Balles
		t.origin.y = 500
		score_control_node.add_score(false) #Der Score aus der score_contorl wird für die rechte Seite erhöht
	else:
		t.origin.x = 600 
		t.origin.y = 500
		score_control_node.add_score(true) #Der Score aus der score_contorl wird für die linke Seite erhöht
	
	state.set_transform(t)

func _integrate_forces(state):
	for body in get_colliding_bodies():
		if body.is_in_group("floor"):
			add_score(state, body) #Die add_score Funktion wird aufgerufen und die state des Objektes und der colliding body mitgegeben 
		if body.is_in_group("players") && gravity_scale == 0: 
			gravity_scale = save_gravity_scale #Die in der add_score ausgestellte Gravity wird zurückgesetzt
