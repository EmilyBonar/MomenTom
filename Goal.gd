extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Goal_body_entered(body):
	if body.name != "Player": return
	var path = "res://levels/Level_" + str(int(get_tree().current_scene.name)+1) + ".tscn"
	var err = get_tree().change_scene(path)
	if err:
		get_tree().change_scene("res://End.tscn")
