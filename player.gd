extends CharacterBody2D

@export var health = 3;
@export var alive = true;
@export var leavespeed = 500;

func _physics_process(delta):
	if alive:
		velocity = position.direction_to(get_global_mouse_position()) * Vector2(abs(position.x - get_global_mouse_position().x),abs(position.y - get_global_mouse_position().y));
		var collision = move_and_collide(velocity*delta)
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
