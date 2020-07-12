extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var fahrenheit: float = 0.0
var celcius: float = 0.0

func ctof(num):
	num = float(num)
	
	var c = num
	celcius = num
	fahrenheit = ((c * (9.0/5.0)) + 32)
	print(fahrenheit)
	$"edit-fahrenheit".text = str(fahrenheit)
	pass
	
func ftoc(num):
	num = float(num)
	var f = num
	fahrenheit = num
	celcius =  ((f - 32) * (5.0/9.0))
	# print(((f - 32) * (5/9)))
	$"edit-celcius".text = str(celcius)
	pass	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_editcelcius_text_changed(new_text):
	ctof(new_text)
	pass # Replace with function body.


func _on_editfahrenheit_text_changed(new_text):
	ftoc(new_text)
	pass # Replace with function body.
