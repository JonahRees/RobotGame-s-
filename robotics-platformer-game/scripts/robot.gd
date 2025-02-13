extends Node2D
@onready var main: Node2D = $".."
@onready var physics: CharacterBody2D = $Physics
@onready var _intake: AnimatedSprite2D = $Physics/Intakes/Intake
@onready var _climb: AnimatedSprite2D = $Physics/Climbs/Climb
@onready var _arm: AnimatedSprite2D = $Physics/Arms/Area2D/Arm
@onready var grappling: TileMap = $"../Maps/grappling"
@onready var rope: Node2D = $"../Rope"
@onready var rope_2: Node2D = $"../Rope2"
@onready var timer: Node2D = $Physics/TIMER

var repairing=false
var arm_
var climb_
var intake_
# Called when the node enters the scene tree for the first time.
var inair
func get_level():
	return main.level
func _ready() -> void:
	arm_ = main.get_arm()
	intake_=main.get_intake()
	climb_=main.get_climb()
func climby():
	rope.climb()
	rope_2.climb()
func reset():
	rope.reset()
	rope_2.reset()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_arm.play(arm_)
	_intake.play(intake_)
	inair=physics.inair()
	if climb_ =="grapple" and physics.get_climbing():
		_climb.play("grapple2")
	elif climb_=="jump" and not inair:
		_climb.play("none")
	else:
		_climb.play(climb_)

func get_arm():
	return arm_
func get_intake():
	return intake_
func get_climb():
	return climb_


func repair():
	repairing=true
	physics.repair()
func exit_repair():
	repairing=false
	arm_ = main.arm
	intake_=main.intake
	climb_=main.climb
	physics.exit_repair()
func get_direction():
	return physics.get_direction()
func get_location():
	return physics.get_velocityy()
	
func get_repairing():
	return repairing

func get_pos():
	return physics.get_pos()
func start(eeeee):
	physics.start(eeeee)
	timer.set_l(eeeee)
	
func restart():
	physics.restart()
func die():
	await get_tree().create_timer(1).timeout
	main.die()
func checkpoint(x,y):
	physics.checkpoint(x,y)
func getdevice():
	return main.getdevice()
	
var climbing = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func is_climbing():
	return climbing
