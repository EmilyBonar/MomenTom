extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tiles = get_node("../ConveyorMap")
var positions

# Called when the node enters the scene tree for the first time.
func _ready():
	positions = [position]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _integrate_forces(state):
	if tiles:
		if $Sprite.get_scale()[0] == 2:
			positions = [position, position+Vector2.LEFT*16, position+Vector2.UP*16, position+Vector2.LEFT*8+Vector2.UP*16]
		else:
			positions = [position]
		for pos in positions:
			var tpos = pos/16
			var itile = tiles.get_cellv(tpos)
			
			if itile == 2:
				state.linear_velocity += (Singleton.getConveyorDirection(tiles, tpos)*5)
