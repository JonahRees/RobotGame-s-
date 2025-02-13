extends Node
@onready var gamepiece: Node2D = $Gamepiece
@onready var gamepiece_2: Node2D = $Gamepiece2
@onready var gamepiece_3: Node2D = $Gamepiece3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func start(level):
	print("muffin")
	gamepiece.victory(level)
	gamepiece_2.victory(level)
	gamepiece_3.victory(level)
func restart():
	gamepiece.restart()
	gamepiece_2.restart()
	gamepiece_3.restart()
func checkpoint(x,y):
	gamepiece.checkpoint(x,y)
	gamepiece_2.checkpoint(x,y)
	gamepiece_3.checkpoint(x,y)
func repair():
	gamepiece.repair()
	gamepiece_2.repair()
	gamepiece_3.repair()
func exit_repair():
	gamepiece.exit_repair()
	gamepiece_2.exit_repair()
	gamepiece_3.exit_repair()
