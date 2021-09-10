extends AudioStreamPlayer

var effects = {
	"collision": preload("res://assets/collision.ogg")
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func play_sound(effectName, position = Vector2(0,0)):
	var player = AudioStreamPlayer2D.new()
	player.stream = effects[effectName]
	player.position = position
	player.volume_db = 8
	add_child(player)
	player.play()
