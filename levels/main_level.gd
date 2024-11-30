extends Node2D

@onready var mouse_position = get_viewport().get_mouse_position()
@onready var jumper = %jumper
@onready var jumpdir = %jumper/jumpdir
@onready var direction
@onready var angle
var pivotpos
var magnitude
var hopforce

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("left_click") and jumper.is_on_floor():
		if Input.is_action_just_pressed("left_click"):
			pivotpos = get_viewport().get_mouse_position()
		jumpdir.visible = true
		direction = pivotpos - get_viewport().get_mouse_position()
		magnitude = direction.length()
		angle = direction.angle() 
		jumpdir.rotation = angle + 1.5
		if (magnitude > 200):
			magnitude = 200
		jumpdir.scale.y = magnitude / 100
		var jumpdirection = Vector2(direction)
	elif not Input.is_action_pressed("left_click") and jumpdir.visible and jumper.is_on_floor():
		jumpdir.visible = false
		jumper.jump(direction.x, direction.y)
