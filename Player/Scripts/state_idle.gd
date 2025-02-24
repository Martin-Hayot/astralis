class_name StateIdle extends State

@onready var walk: StateWalk = $"../Walk"

## What happens when the player enters this State ?
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass
	
## What happens when the player exits this State ?
func Exit() -> void:
	pass
	

## What happens during the _process update  in this State ?
func Process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

func Physics(_delta: float) -> State:
	return null

func HandleInput(_event: InputEvent) -> State:
	return null
