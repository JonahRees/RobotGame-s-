extends CharacterBody2D
@onready var gp: Node2D = $".."


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var lastsave
var touching = false
var carried = false
var direction
var veloci
var pos
var e
var repairing=false
var f
func _ready():
	position.x=50
	position.y=0
var arm = "rotator"
func repair():
	repairing=true
func exit_repair():
	repairing=false
	arm=gp.get_arm()
func _process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and not carried:
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("intake") and touching and gp.get_intake()=="square" and not gp.carrying():
		carried=true
		gp.carry()
	# Handle jump.
	
	if Input.is_action_just_pressed("launch") and carried and not repairing:
		if arm=="launcher":
			visible=true
			carried=false
			velocity.x= gp.get_direction()*150
			velocity.y = JUMP_VELOCITY
			gp.drop()
		elif not (arm=="extendo" and touching2):
			visible=true
			carried=false
			velocity.x= gp.get_direction()*30
			gp.drop()
		if arm=="extendo":
			velocity.x=0
			
				
				
	if is_on_floor():
		if velocity.x>0:
			velocity.x-=10
		elif velocity.x<0:
			velocity.x+=10

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if carried:
		#visible=false
		e=gp.get_pos()
		position.x=(e[0]*.75)
		position.y=(e[1]*.75)
		if arm=="extendo":
			position.y-=30
		elif arm=="rotator":
			direction=gp.get_direction()
			if direction==1:
				position.x+=16
			if direction==-1:
				position.x-=16
	else:
		move_and_slide()


func _on_area_2d_body_exited(_body: Node2D) -> void:
	touching=false



func _on_area_2d_body_entered(_body: Node2D) -> void:
	touching=true

var touching2
func _on_area_2d_2_body_entered(_body: Node2D) -> void:
	touching2=true


func _on_area_2d_2_body_exited(_body: Node2D) -> void:
	touching2=false

func entered_extendo():
	touching2=false
func victory(level):
	if level == 0:
		position.x=1320
		position.y=216
	if level==1:
		position.x=1225
		position.y=-140
	if level==2:
		position.x= 500
		position.y=-1175
	if level==3:
		position.x=-483
		position.y=-27
	if level==4:
		position.x=136
		position.y=-168
	elif level==5:
		position.x=-90
		position.y=876
	elif level==6:
		position.x=0
		position.y=0
	lastsave=[position.x,position.y]
func restart():
	position.x=lastsave[0]	
	position.y=lastsave[1]	
func checkpoint(x,y):
	lastsave=[position.x,position.y]
