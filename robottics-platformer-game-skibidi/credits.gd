extends Node2D
@onready var timer: Node2D = $TIMER

var level=7
# Called when the node enters the scene tree for the first time
func get_level():
	return 7
var e = preload("res://tutorial.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	timer.set_l(level)
	if Input.is_action_just_pressed("skip"):
		get_tree().change_scene_to_file("res://tutorial.tscn")
func _end():
	get_tree().reload_current_scene()
	
