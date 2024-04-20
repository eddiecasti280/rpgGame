extends Node2D
@onready var label = $Label
@onready var progress_bar = $ProgressBar
@onready var hurt = $ProgressBar/hurt

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if progress_bar.value == 100:
		progress_bar.hide()
	else:
		progress_bar.show()

func display_message():
	label.show()

func hide_message():
	label.hide()

func get_hurt():
	progress_bar.value -= 10
	hurt.play()
