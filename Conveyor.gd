extends Area2D

signal move_player

var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Move")
	direction = Vector2.UP.rotated(transform.get_rotation())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Conveyor_body_entered(body):
	if body.name == "Player":
		emit_signal("move_player", direction)
	else:
		body.add_central_force(direction*600)


func _on_Conveyor_body_exited(body):
	if body.name == "Player":
		#emit_signal("move_player", -Vector2.UP.rotated(transform.get_rotation())*0.75)
		pass
	else:
		body.add_central_force(-direction*600)
		#body.apply_central_impulse(-direction*1200)
