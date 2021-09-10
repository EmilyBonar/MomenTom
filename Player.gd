extends KinematicBody2D

signal deaths_changed

const ACCELERATION = 512
const MAX_SPEED = 64
const FRICTION = 0.01
const COLLIDE_FRICTION = 0.5
const EXPLOSION_NUMBER = 30

var motion = Vector2.ZERO
var mousepoint
var vector
var deaths = 0;
var conveyor = false

var Explosion_Particle = preload("res://ExplosionParticle.tscn")
onready var tiles = get_node("../ConveyorMap")

var mouse_over_pit = false

func _physics_process(delta):
	if Input.is_action_pressed("Click") and not mouse_over_pit:
		mousepoint = get_global_mouse_position()
		vector = (mousepoint - get_position()).normalized()
		motion += vector * ACCELERATION * delta
		
	if Input.is_action_just_pressed("RightClick") and $"../TileMap".get_cellv(position/16) == -1:
		explode()
	
	if tiles:
		var tpos = position/16
		var itile = tiles.get_cellv(tpos)
		
		if itile == 2:
			motion += Singleton.getConveyorDirection(tiles, tpos) * 5
	
	motion *= (1-FRICTION)
	
	var collision = move_and_collide(motion*delta, false)
	
	if collision and collision.collider.name == "TileMap":
		hide()
		position = Vector2(35,88)
		motion = Vector2.ZERO
		deaths += 1
		emit_signal("deaths_changed", deaths)
		Singleton.add_death()
		show()
	elif collision and collision.collider.name != "Walls":
		motion *= (1-COLLIDE_FRICTION)
		collision.collider.apply_central_impulse(-collision.normal * motion.length() * 2)

func over_pit(status):
	mouse_over_pit = status
	
func conveyor_move(direction):
	motion += direction*40

func explode():
	for i in range(EXPLOSION_NUMBER):
		var angle = deg2rad(float(i) / float(EXPLOSION_NUMBER) * 360)
		var ray = Vector2(sin(angle), cos(angle)).normalized()
		
		var particle = Explosion_Particle.instance()
		particle.position = position + Vector2(0, -8) + ray*10
		
		particle.apply_central_impulse(ray*300 + motion)
		get_parent().add_child(particle)
		
