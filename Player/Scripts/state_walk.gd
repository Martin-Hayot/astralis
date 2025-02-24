class_name StateWalk extends State

@export var move_speed: float = 80.0
@onready var idle: StateIdle = $"../Idle"

## What happens when the player enters this State ?
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass
	
## What happens when the player exits this State ?
func Exit() -> void:
	pass
	

## What happens during the _process update  in this State ?
func Process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.UpdateDirection():
		player.UpdateAnimation("walk")
	return null

func Physics(_delta: float) -> State:
	return null

func HandleInput(_event: InputEvent) -> State:
	return null
