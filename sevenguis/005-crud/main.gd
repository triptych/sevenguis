extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var data = []
var firstName = ""
var lastName = ""
var lNameFilter = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func loadData():
	print("loading data")

func saveData():
	print("saving data")
	
func updateData(idx):
	var keyFName 
	var keyLName 
	#print(str(keyFName, keyLName))
	#print(str("updating data", itm))
	var itemText = $list_items.get_item_text(idx)
	print(str("itemText:", itemText))
	var regex = RegEx.new()
	regex.compile("[a-zA-Z]+")
	# for result in regex.search_all(itemText):
	#	 print(result.get_string())
	var result = regex.search_all(itemText)
	if result:
		keyFName = result[1]
		keyLName = result[0]
		print(str('fname:', keyFName.get_string()))
		
		for i in data.size():
			if data[i]["firstname"] == keyFName.get_string() :
				if data[i]["lastname"] == keyLName.get_string():
					# data.remove(i) 
					data[i]["firstname"] = $input_name.text
					data[i]["lastname"] = $input_surname.text
					display_array_in_list(data)
					break
			pass
		
	
		
func createData(fName,lName):
	var name = {"firstname": fName, "lastname": lName}
	data.append(name)
	
	print(str("creating data, firstname ", fName, " lastname ", lName))
	print_elements_of(data)

func deleteData(fName, lName):
	for i in data.size():
		if data[i]["firstname"] == fName :
			if data[i]["lastname"] == lName:
				data.remove(i)
				display_array_in_list(data)
				break
	pass
func displayData():
	print("displaying data")	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_create_pressed():
	print("on button create")
	createData($input_name.text, $input_surname.text)
	display_array_in_list(data)
	pass # Replace with function body.


func _on_btn_update_pressed():
	print("on button update")
	var selected = $list_items.get_selected_items()
	if selected :
		updateData(selected[0])
	# updateData($list_items.get_selected_items()[0])
	pass # Replace with function body.


func _on_btn_delete_pressed():
	print("on button delete pressed")
	deleteData($input_name.text, $input_surname.text)
	pass # Replace with function body.

func print_elements_of(array):
	# Here we are using one of the Pool array types
	print(PoolStringArray(array).join(""))
	
func display_array_in_list(array):
	$list_items.clear()
	for i in data.size():
		if lNameFilter=="": 
			$list_items.add_item(str(data[i]["lastname"], ", " ,data[i]["firstname"]))
		elif lNameFilter != "" && lNameFilter in data[i]["lastname"] :
			$list_items.add_item(str(data[i]["lastname"], ", " ,data[i]["firstname"]))
		
	pass	


func _on_list_items_item_selected(index):
	# $input_name.text = data[index]["firstname"]
	# $input_surname.text = data[index]["lastname"]
	var selIdx = $list_items.get_selected_items()[0]
	var selText = $list_items.get_item_text(selIdx)
	var regex = RegEx.new()
	regex.compile("[a-zA-Z]+")
	var result = regex.search_all(selText)
	if result:
		$input_name.text = result[1].get_string()
		$input_surname.text = result[0].get_string()
	
	pass # Replace with function body.


func _on_input_prefix_text_changed(new_text):
	print(str("text changed : ", new_text))
	lNameFilter = new_text
	display_array_in_list(data)
	pass # Replace with function body.
