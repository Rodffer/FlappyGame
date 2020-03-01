extends Node2D

onready var bird = get_node("Bird")
onready var floor_anim = get_node("FloorAnim")
onready var back_anim = get_node("BackAnim")
onready var time_to_replay = get_node("TimeToReplay")

var points = 0
var state = 1

const PLAY = 1
const END = 2

func _ready():
	
	pass
	
func kill():
	bird.apply_impulse(Vector2(0,0), Vector2(-1000,0))
	floor_anim.stop()
	back_anim.stop()
	#get_node("Bird/bird_anim").set_frame()
	state = END
	time_to_replay.start()
	

func _on_TimeToReplay_timeout():
	get_tree().reload_current_scene()
