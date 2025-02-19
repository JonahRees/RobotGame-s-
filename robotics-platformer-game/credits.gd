extends Node2D
@onready var timer: Node2D = $TIMER
@onready var text_3: RichTextLabel = $RichTextLabel3

@onready var highscore: Node2D = $Highscore
var level=7
# Called when the node enters the scene tree for the first time
func _ready() -> void:
	var score = highscore.load()
	if  timer.minutes<score[0]or(timer.minutes<=score[0] and timer.seconds<=score[1]):
		text_3.text=("NEW HIGHSCORE")
		highscore.save()
	else:
		var hugs =score[1]
		if hugs<10:
			hugs="0"+str(hugs)
		else:
			hugs=str(hugs)
		text_3.text="Lowest time - "+str(score[0])+":"+hugs
func get_level():
	return 7
var e = preload("res://tutorial.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	timer.set_l(level)
	if Input.is_action_just_pressed("skip"):
		get_tree().change_scene_to_file("res://intro.tscn")
func _end():
	get_tree().reload_current_scene()
	
