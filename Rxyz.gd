extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var my_style = StyleBoxFlat.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	my_style.set_bg_color(Color.azure)
	set("custom_styles/normal", my_style)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
