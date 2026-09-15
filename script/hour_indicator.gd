extends Polygon2D

func _ready() -> void:
	var r := 6
	polygon = PackedVector2Array([\
		Vector2(0,0),\
		Vector2(r,r),\
		Vector2(-r,r)\
		]);
		
	queue_redraw()
