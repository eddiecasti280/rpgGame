extends Node2D

@export var minion_res : Minion
@onready var audio_stream_player = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	await get_tree().create_timer(2).timeout
	show()
	await get_tree().create_timer(0.5).timeout
	#minion_res.summoning_sound.play()
	print(minion_res.health)
	audio_stream_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
