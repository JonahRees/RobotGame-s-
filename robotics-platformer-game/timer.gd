extends Node2D
@onready var texty: RichTextLabel = $RichTextLabel

static var seconds = 0
static var minutes = 0
var level =7
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var e =false
var hugs
func add():
	if level >=1 and  level <=5:
		texty.visible=true
		e=true
		hugs=str(seconds)
		if seconds<10:
			hugs="0"+hugs
		texty.text="Current time - "+str(minutes)+":"+hugs
		await get_tree().create_timer(1).timeout
		seconds+=1
		if seconds>=60:
			minutes+=1
			seconds=0
		e=false
	else:
		texty.visible=false
	if level==7:
		texty.visible=true
		texty.text="Final time - "+str(minutes)+":"+str(seconds)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not e:
		add()
	
func set_l(l):
	level=l
