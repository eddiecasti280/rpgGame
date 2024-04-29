extends CharacterBody2D
@onready var jester = $animated_jester
@onready var minion_1_spawn = $Minion1_Spawn
@onready var minion_2_spawn = $Minion2_Spawn
@onready var minion_3_spawn = $Minion3_Spawn

const ally = preload("res://minion.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	spawn_minions(3)

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
	if Input.is_action_just_pressed("move_right"):
		jester.flip_h = false
		
# Spawn "count" number of minions from the list
func spawn_minions(count) -> void:
	var names = ["Duck", "Smiley", "Mage"]
	for value in range(count):
		print(value)
		var minion = ally.instantiate()
		call_deferred("add_child", minion)
		var iteration = str(value + 1)
		var spawnName = "Minion" + iteration + "_Spawn"
		minion.global_position = get_node(spawnName).global_position
		minion.init(names[value],(Constants.minions[names[0]]))
		

func _on_interact_area_body_entered(body):
	body.get_parent().display_message()
	

func _on_interact_area_body_exited(body):
	body.get_parent().hide_message()


