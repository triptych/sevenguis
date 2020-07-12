extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$value.text = str(count)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_count_button_down():
	count += 1
	$value.text = str(count)
	pass # Replace with function body.
