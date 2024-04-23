extends Node2D

@onready var duck = $duck
@export var minion_res : Minion

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	#flip()
	pass
	

func flip():
	duck.rotation += PI/180




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
