class_name Player extends CharacterBody2D

var cardinal_direction: Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var is_facing_up: bool = false  # Track whether facing up or down

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine

func _ready() -> void:
	state_machine.Init(self)

func _process(delta: float) -> void:
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	direction = direction.normalized()
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()

func UpdateDirection() -> bool:
	var new_direction : Vector2 = cardinal_direction

	if direction == Vector2.ZERO:
		return false

	# Prioritize UP and DOWN over LEFT and RIGHT
	if direction.y != 0:
		new_direction = Vector2.UP if direction.y < 0 else Vector2.DOWN
		is_facing_up = (new_direction == Vector2.UP)  # Update facing direction
	elif direction.x != 0:
		new_direction = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT

	if new_direction == cardinal_direction:
		return false

	cardinal_direction = new_direction
	return true


func UpdateAnimation(state: String) -> void:
	animated_sprite.play(state + "_" + AnimationDirection())

func AnimationDirection() -> String:
	match cardinal_direction:
		Vector2.DOWN:
			return "down"
		Vector2.UP:
			return "up"
		Vector2.LEFT:
			return "up_left" if is_facing_up else "down_left"
		Vector2.RIGHT:
			return "up_right" if is_facing_up else "down_right"
	
	return "down"
