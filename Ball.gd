extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var random_swing = 0

func _ready():
	random_swing = rand_range(-1.2,1.2)
	self.angular_velocity = random_swing * PI

# Called when the node enters the scene tree for the first time.

func _physics_process(_delta):
	self.apply_impulse(Vector2.ZERO, Vector2(0,random_swing))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_area_entered(_area):
	queue_free()
	
func _on_Ball_body_entered(_body):
	random_swing = 0
