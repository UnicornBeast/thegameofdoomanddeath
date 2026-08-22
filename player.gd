extends CharacterBody2D

@export var health = 3;
@export var alive = true;

func _physics_process(delta):
	position = get_global_mouse_position();
