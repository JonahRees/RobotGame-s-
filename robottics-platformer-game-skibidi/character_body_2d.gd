extends CharacterBody2D
@onready var rope: Node2D = $".."



const SPEED = 300.0
const JUMP_VELOCITY = -400.0


var grappling=false
# Called every frame. 'delta' is the elapsed time since the previous frame.
var e =0
var touching = false
var climbing=false
func climb():
	if not climbing:
		position.y=0
		position.x=0
	climbing=true
	velocity.y = -100000
	move_and_slide()
func _process(delta: float) -> void:
	position.y=0
	position.x=0
	velocity.y = -100000
	move_and_slide()
func reset():
	velocity.y=0
	climbing=false
