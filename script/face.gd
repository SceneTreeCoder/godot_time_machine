extends Sprite2D

@onready var indicator :PackedScene = preload("res://scene/hour_indicator.tscn")

@export_range(10,200,1) var R:float = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	createIndicators()	

func createIndicators():
	for angleStep in range(12):
		var angle = angleStep * PI / 6
		var indicator_instance :Polygon2D = indicator.instantiate();
		add_child(indicator_instance)
		indicator_instance.move_local_x(sin(angle) * R)
		indicator_instance.move_local_y(cos(angle) * R)
		indicator_instance.rotation = 0-angle
		match(angleStep%2):
			0:
				indicator_instance.color = Color(0,0,0)
			_:
				indicator_instance.color = Color(0,0,0,0.3)
