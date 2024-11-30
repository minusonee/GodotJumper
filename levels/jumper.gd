extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jumping
var xjumpvel = 0

func _physics_process(delta: float) -> void:
	if is_on_floor() && !jumping:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		jumping = false
		velocity += get_gravity() * delta
	
	
	move_and_slide()

func jump(x_velocity, y_velocity: float):
	jumping = true
	%jumper.velocity.y = y_velocity*5
	%jumper.velocity.x = x_velocity*5
