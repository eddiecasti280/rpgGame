extends CharacterBody2D

# local nodes
@onready var minion_sprite = $minion_sprite
@onready var audio_stream_player = $AudioStreamPlayer
@onready var healthBar = $HealthBar
@onready var timer = $Timer

# external
#@export var minion_res : Minion
#@export var speed : int = Constants.minions.Duck.Speed
@export var speed : int = 0
@export var health : int = 0
@export var magic_attack : int = 0
@export var attack : int = 0

var target_position: Vector2 = Vector2.ZERO

func init(name,minion):
	# specify animation
	self.name = name
	#minion_sprite.Animation.frame = name
	speed = minion.Speed
	health = minion.Health
	attack = minion.Attack
	magic_attack = minion.MagicAttack
	#minion_sprite.animation.set_animation(name)

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	#flip()
	#print(Constants.minions.Duck.Health)
	#print(global_position, target_position)
	print("This is the name:", name)
	minion_sprite.animation = str(name)
	print(minion_sprite.animation)
	#minion_sprite.animation.set_animation(name)
	choose_pos()

func choose_pos():
	timer.wait_time = Constants.RNG.randi_range(1,4)
	target_position = global_position + Vector2(Constants.RNG.randi_range(-100,100), Constants.RNG.randi_range(-100,100))
	velocity = (target_position - global_position).normalized() * speed
	if velocity.x >= 0:
		minion_sprite.flip_h = false
	else:
		minion_sprite.flip_h = true

func _physics_process(delta):
	set_velocity(velocity)
	move_and_slide()

func flip():
	minion_sprite.rotation += PI/180

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lerp(global_position, target_position, 0.1)


func _on_timer_timeout():
	choose_pos()
