extends Area2D

@export var speed = 150

@onready var screensize = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input  = Input.get_vector("left", "right", "up", "down")
	if input.x > 0:
		$Ship.frame = 2
		$Ship/Boosters.animation = "right"
	elif input.x < 0:
		$Ship.frame = 0
		$Ship/Boosters.animation = "left"
	else:
		$Ship.frame = 1
		$Ship/Boosters.animation = "default"
	position += input * speed * delta
	position = position.clamp(Vector2(8, 8), screensize - Vector2(8, 8))
