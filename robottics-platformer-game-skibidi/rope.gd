extends Node2D
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var robot: Node2D = $"../Robot"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var grappling=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible=false
# Called every frame. 'delta' is the elapsed time since the previous frame.
var e =0
var climbing=false
var touching = false
func climb():
	climbing=true
	self.visible=true
	character_body_2d.climb()
func reset():
	climbing=false
	self.visible=false
	character_body_2d.reset()
func go_to(p):
	animated_sprite_2d.position=p	
	self.visible=true
var currentScale=1
func _process(_delta: float) -> void:
	currentScale=(character_body_2d.position.y-animated_sprite_2d.position.y)/18
	if currentScale<0:
		currentScale=-currentScale
	animated_sprite_2d.position.x=character_body_2d.position.x
	animated_sprite_2d.position.y=((robot.get_pos()[1]*.75)-self.position.y)
	animated_sprite_2d.scale.y= currentScale
	self.position.x=((robot.get_pos()[0])*.75)+5
	if not climbing:
		self.position.y=((robot.get_pos()[1])*.75)
func get_pos():
	return robot.get_pos()
	
