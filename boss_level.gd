extends Node2D

@export var shipSpeed = 25
@export var shipSpeed2 = 25
@export var bulletSpeed = 175
@export var bulletSpeed2 = 175
@export var enemyHealth = 25
@export var enemy2Health = 25
@export var bossHealth = 50
@onready var bulletSprite = $Enemy/EnemyBullet/BulletSprite
@onready var bullet = $Enemy/EnemyBullet
@onready var shipSprite = $Enemy/Ship/ShipSprite
@onready var ship = $Enemy/Ship
@onready var bulletSprite2 = $Enemy2/EnemyBullet/BulletSprite
@onready var bullet2 = $Enemy2/EnemyBullet
@onready var shipSprite2 = $Enemy2/Ship/ShipSprite
@onready var ship2 = $Enemy2/Ship
@onready var bulletSpace = $BulletRemoval/BulletSpace
var is_alive = true
var third_quarterhealth = false
var half_health = false
var first_quarterhealth = false
var doBullet = false
var doBullet2 = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#shoot a bullet from the enemy side
func _bullet() -> void:
	bulletSprite.visible = true
	bullet.position.x -= bulletSpeed*get_process_delta_time()
func _notbullet() -> void:
	bulletSprite.visible = false
	bullet.position.x = ship.position.x
	
func _bullet2() -> void:
	bulletSprite2.visible = true
	bullet2.position.x -= bulletSpeed2*get_process_delta_time()
func _notbullet2() -> void:
	bulletSprite2.visible = false
	bullet2.position.x = ship2.position.x



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	queue_redraw()
	ship.position.x -= shipSpeed*delta
	if doBullet:
		_bullet()
	else:
		_notbullet()
	ship2.position.x -= shipSpeed2*delta
	if doBullet2:
		_bullet2()
	else:
		_notbullet2()
	
#Gets input events.
func _input(event):
	var player = get_node("Node2D/Player")
	if event.is_action_pressed("damagetest") and player.alive:
		player.damage()
	

func _on_bullet_removal_area_entered(area: Area2D) -> void:
		doBullet = false
		bulletSprite.visible = false
		bullet.global_position = ship.global_position
		
#Draws any extra bits and pieces
func _draw():
	var player = get_node("Node2D/Player")
	#Like the healthbar!
	draw_rect(Rect2(Vector2(50,50),Vector2(player.health*10,10)),Color.LIGHT_GREEN)
	
func _enemyDamage() -> void:
	pass

func _on_timer_timeout() -> void:
	doBullet = not doBullet

func _on_timer_2_timeout() -> void:
	doBullet2 = not doBullet2
