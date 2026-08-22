extends CharacterBody2D

@export var health = 3;
@export var alive = true;
@export var leavespeed = 500;

func _physics_process(delta):
	if alive:
		position = get_global_mouse_position();
	else:
		var par = get_node("..")
		var target = par.point1
		velocity = position.direction_to(target) * leavespeed;
		leavespeed *= 1.01
		if position.x > -50:
			move_and_slide()

func damage(amount: int = 1):
	health -= amount;
	if health <= 0:
		alive = false;
