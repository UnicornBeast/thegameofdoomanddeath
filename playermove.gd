extends Node2D


@export var point1 = Vector2(-60,648/2)
var color = Color.LIGHT_GRAY
var width = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_node("Player")
	player.health = 3;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	queue_redraw()
	
func _physics_process(delta: float) -> void:
	pass
func _draw():
	var player = get_node("Player")
	draw_line(point1,player.position,color,width)
