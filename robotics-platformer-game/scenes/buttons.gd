extends Node
@onready var robot: Node2D = $"../Robot"
@onready var main: Node2D = $".."



var completion=[]

# Called when the node enters the scene tree for the first time.
var num1=false
var num2=false
var num3=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
var e=true
var f=false
var level
func _process(_delta: float) -> void:
	if num1 and num2 and num3:
		main.victory()
		
		
		
var num_
func pressed(num):
	if num==7:
		num1=not num1
	if num==8:
		num2=not num2
	if num==9:
		num3=not num3
func victory():
	print("victory")
	
	
