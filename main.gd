extends Node2D

@onready var ui = $DayNightCycleUI
@onready var canvas_modulate: CanvasModulate = $CanvasModulate


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	canvas_modulate.time_tick.connect(ui.set_daytime)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
