extends Node2D


@onready var gp: Node = $Gamepieces
@onready var robot: Node2D = $Robot
@onready var levelmanager: Node2D = $"level manager"
@onready var rope: Node2D = $Rope
@onready var rope_2: Node2D = $Rope2
@onready var death: TileMap = $Maps/death


const CREDITS = preload("res://credits.tscn")


#starting level. (0 is tutorial) Change to set new levels
var level=6

#current device (Xbox or computer)
var device="Xbox"
const TUTORIAL = preload("res://tutorial.tscn")
var levels
func reset():
	robot.reset()
func climby():
	robot.climby()
func _ready() -> void:
	print(levelmanager)
	start()
func start():
	gp.start(level)
	robot.start(level)
func victory():
	print("e")
	var sc = get_tree()
	get_tree().change_scene_to_file("res://credits.tscn")
	sc.reload_current_scene()
	print("e")
# Called every frame. 'delta' is the elapsed time since the previous frame.
var arm="rotator"
var intake="square"
var climb="jump"
var a_num=0
var c_num=0
var i_num=0
var arms=["rotator","extendo","launcher"]
var intakes=["square","circle","triangle"]
var climbs=["jump","grapple","zipline"]
func _process(delta: float) -> void:
	delta=delta
	arm= arms[a_num]
	intake=intakes[i_num]
	climb=climbs[c_num]
	if repairing:
		if Input.is_action_just_pressed("climb"):
			c_num=(c_num+1)%3
			print(climbs[c_num])
		if Input.is_action_just_pressed("intake"):
			i_num=(i_num+1)%3
			print(intakes[i_num])
		if Input.is_action_just_pressed("launch"):
			a_num=(a_num+1)%3
			print(arms[a_num])
	if Input.is_action_just_pressed("restart"):
		gp.restart()
		robot.restart()
		death.restart()
	if Input.is_action_just_pressed("skip"):
		victory()
	if Input.is_action_just_pressed("restartlevel"):
		gp.start(level)
		robot.start(level)
		death.restart()
	if Input.is_action_just_pressed("previous"):
		get_tree().change_scene_to_file("res://lvl_5.tscn")
func die():
	victory()
	
func get_arm():
	return arm
func get_intake():
	return intake
func get_climb():
	return climb
func save():
	print("checkpoint")
	
var repairing=false
func repair():
	print("repair")
	repairing=true
func exit_repair():
	repairing=false
	print("exit repair")
func get_level():
	return level

func getdevice():
	return device
func checkpoint(x,y):
	robot.checkpoint(x,y)
	gp.checkpoint(x,y)
