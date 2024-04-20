extends Node2D

@export var minion_res : Minion
@onready var audio_stream_player = $AudioStreamPlayer
@onready var healthBar = $HealthBar

# Called when the node enters the scene tree for the first time.
func _ready():
	# set with minion's max health
	healthBar.max_value = minion_res.health
	
	hide()
	await get_tree().create_timer(2).timeout
	show()
	await get_tree().create_timer(0.5).timeout
	#minion_res.summoning_sound.play()
	audio_stream_player.play()
	
	# test health bar
	await get_tree().create_timer(0.5).timeout
	hurt(1)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# reduce the minion's health by amount "damage"
func hurt(damage):
	minion_res.health -= damage
	healthBar.value = minion_res.health
