extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	queue_redraw()
	
#Gets input events.
func _input(event):
	var player = get_node("Node2D/Player")
	if event.is_action_pressed("damagetest") and player.alive:
		player.damage()
	
#Draws any extra bits and pieces
func _draw():
	var player = get_node("Node2D/Player")
	#Like the healthbar!
	draw_rect(Rect2(Vector2(50,50),Vector2(player.health*10,10)),Color.LIGHT_GREEN)
