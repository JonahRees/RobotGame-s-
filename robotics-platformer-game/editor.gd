extends Node2D
@onready var background: AnimatedSprite2D = $Background
@onready var intake: AnimatedSprite2D = $Intake
@onready var arm: AnimatedSprite2D = $Arm
@onready var climb: AnimatedSprite2D = $Climb
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var animated_sprite_2d_3: AnimatedSprite2D = $AnimatedSprite2D3
@onready var editor: Node2D = $"."
@onready var robot: Node2D = $"../.."



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
var device
func showimage(image,climby,army,intakey):
	if image=="none":
		editor.visible=false
	else:
		device=robot.getdevice()
		editor.visible=true
		background.play(image)
		intake.play(intakey)
		climb.play(climby)
		arm.play(army)
