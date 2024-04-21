extends CharacterBody2D
@onready var jester = $jester

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# delta in ms
func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# if direction input provided
	if direction:
		velocity = direction * SPEED
	else:
		# velocity.x and velocity.y are both scalars
		velocity.x = move_toward(velocity.x, 0, SPEED) 
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	# changes global position relative to given info.
	move_and_slide()
	
	if Input.is_action_just_pressed("move_left"):
		jester.flip_h = true
	if Input.is_action_just_pressed("move_right"):\
		jester.flip_h = false


func _on_interact_area_body_entered(body):
	body.get_parent().display_message()
	

func _on_interact_area_body_exited(body):
	body.get_parent().hide_message()


