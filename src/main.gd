extends Node2D

var enemy = preload("res://src/enemy/enemy.tscn")
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_enemies()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_enemies():
	for x in range(9):
		for y in range(3):
			var e = enemy.instantiate()
			var pos = Vector2(x * (16 + 8) + 24, 16 * 4 + y * 17)
			add_child(e)
			e.start(pos)
			e.died.connect(_on_enemy_died)

func _on_enemy_died(value):
	score += value
	print("Score: " + score)
