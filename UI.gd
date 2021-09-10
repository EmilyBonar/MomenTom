extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var level = $Level
onready var deaths = $Deaths

# Called when the node enters the scene tree for the first time.
func _ready():
	level.text = "Level " + str(int(get_tree().current_scene.name))

func update_deaths(value):
	deaths.text = "Deaths: " + str(value)
