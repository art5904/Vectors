extends ImmediateGeometry


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# Clean up before drawing.
func _process(_delta):	
	clear()
	
	# Begin draw.
	begin(Mesh.PRIMITIVE_LINES)

	set_color(Color.red)
	# Prepare attributes for add_vertex.
	set_normal(Vector3(0, 0, 1))
	set_uv(Vector2(0, 0))
	# Call last for each vertex, adds the above attributes.
	add_vertex(Vector3(-250, 0, 0))

	set_color(Color.red)
	set_normal(Vector3(0, 0, 1))
	set_uv(Vector2(0, 1))
	add_vertex(Vector3(250, 0, 0))

	set_color(Color.green)
	set_normal(Vector3(0, 0, 1))
	add_vertex(Vector3(0, -250, 0))
	
	set_color(Color.green)
	set_normal(Vector3(0, 0, 1))
	add_vertex(Vector3(0, 250, 0))
	
	set_color(Color.blue)
	set_normal(Vector3(0, 0, 1))
	add_vertex(Vector3(0, 0, -250))
	
	set_color(Color.blue)
	set_normal(Vector3(0, 0, 1))
	add_vertex(Vector3(0, 0, 250))

# End drawing.
	end()
