extends Node2D

@export var shipSpeed = 25
@export var bulletSpeed = 175
@export var enemyHealth = 25
@export var bossHealth = 50
@onready var bulletSprite = $Enemy/EnemyBullet/BulletSprite
@onready var bullet = $Enemy/EnemyBullet
@onready var shipSprite = $Enemy/Ship/ShipSprite
@onready var ship = $Enemy/Ship
@onready var bulletSpace = $BulletRemoval/BulletSpace
var is_alive = true
var third_quarterhealth = false
var half_health = false
var first_quarterhealth = false
var doBullet = false

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	queue_redraw()
	ship.position.x -= shipSpeed*delta
	if doBullet:
		_bullet()
	else:
		_notbullet()
	
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
