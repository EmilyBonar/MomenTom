extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var start_time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_time < 1:
		start_time += delta
	elif linear_velocity.length() < 40:
			queue_free()
