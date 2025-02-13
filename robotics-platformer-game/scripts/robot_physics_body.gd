extends CharacterBody2D
@onready var base: AnimatedSprite2D = $Base
@onready var collision: CollisionShape2D = $Collision
@onready var camera_2d: Camera2D = $Camera2D
@onready var robot: Node2D = $"../.."
@onready var editor: Node2D = $Editor
@onready var arms: AnimatedSprite2D = $Arms/Area2D/Arm



const SPEED = 150.0
const MaxSpeed = 300
var accel = 0
const JUMP_VELOCITY = -400.0
var repairing=false
var direction2 =0
var ziplining=false
var grappled=false
var grappleSpeed=0
var lastdirection
var lastsave
var arm
	
func _physics_process(delta: float) -> void:
	if grappled:
		grappleheight=get_grappleheight()
	if repairing:
		editor.showimage("editor",robot.get_climb(),robot.get_arm(),robot.get_intake())
	if not repairing:
		editor.showimage("none","none","none","none")
		if grappled:
			grappleSpeed+=10
			velocity.y=-grappleSpeed
		else:
			robot.reset()
		# Add the gravity.
		if not is_on_floor() and not ziplining and not grappled:
			velocity += get_gravity() * delta
			
		# Handle jump.
		if Input.is_action_just_pressed("climb"):
			if robot.get_climb()=="jump" and is_on_floor():
				velocity.y = JUMP_VELOCITY
			elif robot.get_climb()=="grapple" and canGrapple:
				grappled= not grappled
				grappleSpeed=0
				if grappled:
					robot.climby()
				else:
					robot.reset()
			elif ziplining:
				ziplining=false
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		if not ziplining:
			var direction := Input.get_axis("left", "right")
			if direction ==1 or direction == -1:
				lastdirection=direction
			base.play("moving")
			if direction:
				accel+=1*direction
				grappled=false
				direction2=direction
				if accel>150:
					accel=150
				velocity.x = (direction * SPEED) +accel
				base.flip_h=(direction*-.5)+.5
				arm=robot.get_arm()
				if lastdirection==-1 and arm=="rotator":
					arms.flip_h=true
					arms.position.x=-5
				else: 
					arms.flip_h=false
					arms.position.x=3
			else:
				accel=0
				velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()

func repair():
	repairing=true
	lastsave=[position.x,position.y]
func exit_repair():
	repairing=false
func get_direction():
	return lastdirection
func get_velocityy():
	return [velocity.x,velocity.y]
func get_pos():
	return position


func _on_zipline_detector_body_entered(_body: Node2D) -> void:
	if robot.get_climb() =="zipline":
		ziplining=true
		velocity.y=0
		velocity.x = lastdirection * SPEED *1.75


func _on_zipline_detector_body_exited(_body: Node2D) -> void:
	ziplining=false

var canGrapple=false
func _on_grapple_detector_body_entered(_body: Node2D) -> void:
	canGrapple=true


func _on_grapple_detector_body_exited(_body: Node2D) -> void:
	canGrapple=false
	grappled=false
func start(level):
	
	position.x=0
	position.y=0
	if level == 0:
		position.y=0
		position.x=0
	if level==1:
		position.y=-25
	if level==2:
		position.y=-750
	lastsave=[position.x,position.y]
func inair():
	return not is_on_floor()
	
func restart():
	position.x=lastsave[0]	
	position.y=lastsave[1]	
func checkpoint(x,y):
	lastsave=[x,y]


func _on_death_body_entered(_body: Node2D) -> void:
	robot.die()

var g1 = 0
var g2 = 0
var g3 = 0
var g4 = 0 
var g5 = 0
var g6 = 0
var g7 = 0
var g8 = 0
var g9 = 0
var g10 = 0
var grappleheights=[g1,g2,g3,g4,g5,g6,g7,g8,g9,g10]
var grappleheight=0
	

func get_grappleheight():
	for h in grappleheights:
		if grappleheights[h]>=1:
			return h
	return "e"
	
			
func get_climbing():
	return grappled
