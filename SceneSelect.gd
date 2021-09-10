extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var level = 1
	var file = File.new()
	while file.file_exists("res://levels/Level_" + str(level) + ".tscn"):
		$ItemList.add_item("Level " + str(level))
		level += 1


func _on_ItemList_item_selected(index):
	get_tree().change_scene("res://levels/Level_" + str(index+1) + ".tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Start.tscn")
