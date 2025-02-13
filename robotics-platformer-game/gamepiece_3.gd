extends Node2D
@onready var robot: Node2D = $"../../Robot"
@onready var gp: CharacterBody2D = $CharacterBody2D

func restart():
	gp.restart()


func checkpoint(x,y):
	gp.checkpoint(x,y)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

var pos 

func get_velocity(): 
	return robot.get_location()
	#pos=pos[0]-200
	#position.x=pos
func get_direction():
	return robot.get_direction()
	
func get_repairing():
	return robot.get_repairing()
func get_arm():
	return robot.get_arm()
func get_pos():
	return robot.get_pos()

func entered_extendo():
	gp.entered_extendo()
func victory(nummy):
	gp.victory(nummy)
func get_intake():
	return robot.get_intake()
var c=false
func carry():
	c=true
func drop():
	c=false
func carrying():
	return c
func repair():
	gp.repair()
func exit_repair():
	gp.exit_repair()
