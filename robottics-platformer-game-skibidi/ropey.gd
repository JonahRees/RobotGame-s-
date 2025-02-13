extends CharacterBody2D

@onready var cs: CollisionShape2D = $Area2D/CollisionShape2D

const SPEED = 300.0
const JUMP_VELOCITY = -700
@onready var an: AnimatedSprite2D = $AnimatedSprite2D

var grappling=false
func _ready() -> void:
	self.visible=false
# Called every frame. 'delta' is the elapsed time since the previous frame.
var e =0
var touching = false
func climb():
	self.position.y=0
	grappling=true
	self.visible=true
	print("e")
	e=0
	await get_tree().create_timer(.05).timeout
	for i in range (10):
		velocity.y = 10
		move_and_slide()
		e+=1
		an.scale.y+=1
	for i in range (e):
		await get_tree().create_timer(.05).timeout
		an.scale.y-=1
		position.y+=10
		if position.y>0:
			position.y=0
			
	self.visible=false
	touching=false
	grappling=false
	self.position.y=0
func reset():
	self.scale.y=1
	self.visible=false
	touching=false
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if grappling:
		touching=true
		print("muffin")


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass
