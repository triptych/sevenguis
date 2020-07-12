extends MenuButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var popup

# Called when the node enters the scene tree for the first time.
func _ready():
	popup = get_popup()
	popup.add_item("one-way flight",10)
	popup.add_item("return flight",20)
	print('ready')
	popup.connect("id_pressed", self, "_on_item_pressed")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_item_pressed(id):
	print('id -- ', id)
	text = popup.get_item_text(popup.get_item_index(id))
	print(text)
	pass
	




