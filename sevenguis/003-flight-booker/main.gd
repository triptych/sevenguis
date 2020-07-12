extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var text1 = ""
var text2 = ""
var text1Valid = false
var text2Valid = false
var message = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $MenuButton.text == "one-way flight":
		$text2.editable = false
		print(text1Valid)
		if text1Valid == true :
			$button.disabled = false
		else:
			$button.disabled = true	
	else:
		$text2.editable = true
		if text1Valid && text2Valid:
			$button.disabled = false
		else:
			$button.disabled = true	
		


func validateDate(string):
	var retVal = false
	var regex = RegEx.new()
	regex.compile("[0-9]{2}\\.[0-9]{2}\\.[0-9]{4}")
	var result = regex.search(string);
	print("result", result)
	if result: 
		print(result.get_string())
		retVal = true
	
	return retVal
	pass

func _on_text1_text_changed(new_text):
	print(new_text)
	if validateDate(new_text):
		print('valid')
		text1Valid = true
		$text1.modulate = Color(1,1,1,1)
		if $MenuButton.text == "return flight":
			$text2.editable = true
		pass
	else:
		print('invalid')
		#text1.selection_color = Color(1,1,1,1)
		#$text1.add_color_override("selection_color",Color(1,1,1,1))
		text1Valid = false
		$text1.modulate = Color(1,0,0,1)
		$text2.editable = false
		pass	
	pass # Replace with function body.


func _on_text2_text_changed(new_text):
	print(new_text)
	if validateDate(new_text):
		text2Valid = true
		$text2.modulate = Color(1,1,1,1)
	else:
		text2Valid = false
		$text2.modulate = Color(1,0,0,1)
	pass # Replace with function body.


func _on_button_pressed():
	# print(message)
	message = str("You have booked a ", $MenuButton.text , " on " , $text1.text )
	$WindowDialog/Label.text = message
	$WindowDialog.popup()
	pass # Replace with function body.
