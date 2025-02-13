extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var speed=-.2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.y+=speed
	speed-=.0005

func restart():
	speed = -.2
	position.y=0
