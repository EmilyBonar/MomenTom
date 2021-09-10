extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.connect("deaths_changed", $UI, "update_deaths")
	$Cursor.connect("over_pit", $Player, "over_pit")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
