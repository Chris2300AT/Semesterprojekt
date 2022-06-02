extends VideoPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_autoplay(true)
	pass # Replace with function body.

func _process(delta):
	if not is_playing():
		play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
