class_name PlayerStateMachine extends Node

var states: Array[State]
var prev_state: State
var curr_state: State 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	UpdateState(curr_state.Process(delta))
	pass

func _physics_process(delta: float) -> void:
	UpdateState(curr_state.Physics(delta))
	pass

func _unhandled_input(event: InputEvent) -> void:
	UpdateState(curr_state.HandleInput(event))
	pass

func Init(_player: Player) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
			
	if states.size() > 0:
		states[0].player = _player
		UpdateState(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT

func UpdateState(new_state: State) -> void:
	if new_state == null || new_state == curr_state:
		return
	if curr_state:
		curr_state.Exit() 
	
	prev_state = curr_state
	curr_state = new_state
	curr_state.Enter()
	pass
