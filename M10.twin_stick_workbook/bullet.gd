class_name bullet extends Area2D

@export var speed := 750


var max_range := 1000.0

var _traveled_distance = 0.0

var damage := 1

func _physics_process(delta: float) -> void:
	var distance := Vector2.RIGHT.rotated(rotation) 
	position += distance * speed * delta
	
	_traveled_distance += speed * delta
	if _traveled_distance > max_range:
		_destroy()


	

func _destroy():
	queue_free()

func _ready() -> void:
	body_entered.connect(func (body : Node) -> void:
		if body is Mob:
			body.health -= damage
	)
	
func _on_body_entered(body: Node2D) -> void:
	_destroy()
