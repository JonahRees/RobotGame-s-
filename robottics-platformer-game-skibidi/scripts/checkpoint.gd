extends Node2D
@onready var collision: CollisionShape2D = $Area2D/CollisionShape2D
@onready var robot: Node2D = $"../../Robot"
@onready var main: Node2D = $"../.."
@onready var text: RichTextLabel = $Area2D/RichTextLabel
@onready var gamepieces: Node = $"../../Gamepieces"

var touching=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text.visible=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
var repairing=false
func _process(delta: float) -> void:
	delta=delta
	if touching and repairing and Input.is_action_just_pressed("interact"):
		main.exit_repair()
		robot.exit_repair()
		gamepieces.exit_repair()
		repairing=false
	elif touching and not repairing and Input.is_action_just_pressed("interact"):
		main.repair()
		robot.repair()
		gamepieces.repair()
		repairing=true


func _on_area_2d_body_entered(body: Node2D) -> void:
	body=body
	touching=true
	text.visible=true
	main.save()
	main.checkpoint(position.x/.75,position.y/.75)
func _on_area_2d_body_exited(body: Node2D) -> void:
	body=body
	touching=false
	text.visible=false

	
