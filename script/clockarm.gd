extends Polygon2D
class_name ClockArm

enum types {HOUR, MINUTE, SECOND}
@export var type:types = types.HOUR:
	get:
		return type
	set(value):
		type = value
		_redraw();

@export_range(20,220,1) var length:float=100:
	get:
		return length
	set(value):
		length = value
		_redraw()

@export_range(1,40,1) var width:float=20:
	get:
		return width
	set(value):
		width = value
		_redraw()


func _redraw() -> void:
	
	polygon = PackedVector2Array([\
		Vector2(width, -30),\
		Vector2(-width,-30),\
		Vector2(-width,length-30),\
		Vector2(0,length),\
		Vector2(width,length-30)\
	]);
	

func _ready() -> void:
	_redraw()
	_on_timer_timeout()
	queue_redraw()

func _on_timer_timeout() -> void:
	var t = Time.get_time_dict_from_system()
	var v:float = 0
	match (type):
		types.HOUR:
			v = (t['hour'] % 12)/12.0 + (t['minute']/60.0)*1/12.0;
		types.MINUTE:
			v = (t['minute']) / 60.0 + (t['second']/60.0)*1/60.0;
		types.SECOND:
			v = (t['second']) / 60.0;
	rotation = PI + v*PI*2
