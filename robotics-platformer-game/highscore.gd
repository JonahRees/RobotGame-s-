extends Node2D
var save_path="user://variable.save"
@onready var timer: Node2D = $"../TIMER"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var hs_minutes = 0
var hs_seconds = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func save():
	var file = FileAccess.open(save_path,FileAccess.WRITE)
	hs_minutes=timer.minutes
	hs_seconds=timer.seconds
	file.store_var(hs_minutes)
	file.store_var(hs_seconds)
func load():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path,FileAccess.READ)
		hs_minutes= file.get_var(hs_minutes)
		hs_seconds= file.get_var(hs_seconds)
	else:
		hs_minutes=99999999
		hs_seconds=59
	return[hs_minutes,hs_seconds]
