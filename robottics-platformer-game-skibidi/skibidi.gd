extends Node2D

static var minutes
static var seconds
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _set(minute,second):
	print(minute)
	print(second)
	minutes=minute
	seconds=second
func get_minutes():
	return minutes
func get_seconds():
	return seconds
