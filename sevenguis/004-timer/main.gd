extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var total_time = 60 #start with 60 seconds possible
var elapsed_time = 0 #begin with 0 seconds
const TIME_PERIOD = 1 #every 1 seconds
signal onesec
var time = 0 #timer countdown

# Called when the node enters the scene tree for the first time.
func _ready():
	# $progress_bar.value = 38.5
	$progress_bar.max_value = 60
	$slider.max_value = 600
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time+=delta
	if time > TIME_PERIOD:
		emit_signal("onesec")
		#reset timer
		time = 0
	pass


func _on_main_onesec():
	elapsed_time += 1
	print(str("second: ", elapsed_time))
	$label_elapsed_time_sec.text = str(elapsed_time)
	$progress_bar.value = elapsed_time
	pass # Replace with function body.


func _on_btn_reset_pressed():
	elapsed_time = 0
	pass # Replace with function body.





func _on_slider_value_changed(value):
	print(str("value changed:", value))
	$progress_bar.max_value = $slider.value
	pass # Replace with function body.
