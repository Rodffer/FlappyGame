extends Node2D

export var vel = -400
var scene

func _ready():
	scene = get_tree().get_current_scene()
	set_process(true)
	
func _process(delta):
	if scene.state == scene.PLAY:
		set_pos(get_pos() + Vector2(vel * delta, 0))
	
	if get_pos().x < -100:
		print("destroyed")
		queue_free()

func _on_Area2D_body_enter( body ):
	if body.get_name() == "Bird":
		scene.kill()
