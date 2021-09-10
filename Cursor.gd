extends Node2D

signal over_pit

var radius = 1
var color = Color(1,1,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _draw():
	draw_set_transform_matrix(get_global_transform().affine_inverse())
	draw_circle(position, radius, color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = get_global_mouse_position()
	
	if $"../TileMap".get_cellv(position/16) == 0 or $"../TileMap".get_cellv(position/16) == 1:
		radius = 1
		color = Color(1,0,0)
		update()
		emit_signal("over_pit", true)
	else:
		color = Color(1,1,1)
		if Input.is_action_just_pressed("Click"):
			radius = 2
			color = Color(.95,.95,.95)
		elif Input.is_action_just_released("Click"):
			radius = 1
			color = Color(1,1,1)
		update()
		emit_signal("over_pit", false)
	
