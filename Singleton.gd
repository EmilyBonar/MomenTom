extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var total_deaths = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_death():
	total_deaths += 1
	
func get_deaths():
	return total_deaths

func getRotation(xflip, transpose):
	if not xflip and not transpose:
		return 0
	elif xflip and not transpose:
		return 180
	elif not xflip and transpose:
		return 270
	elif xflip and transpose:
		return 90

func getConveyorDirection(tiles, tpos):
	return Vector2.UP.rotated(deg2rad(getRotation(tiles.is_cell_x_flipped(tpos.x, tpos.y), tiles.is_cell_transposed(tpos.x, tpos.y))))
