extends ImmediateGeometry


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Tail = Vector3()
var Head = Vector3()

var u = Vector3()
var v = Vector3()
var w = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(tail,head):
	Head = head
	Tail = tail
	
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):	
	#calc arrow point vertices here
	#build axes orthogonal to Head
	
	var notdone = true
	while notdone:
		u = Head.normalized()
		if u.x != 0 and notdone:
			
			
			v.x = u.x
			v.y = u.y
			v.z = -(u.x*v.x + u.y*v.y) / u.x
			notdone = false
		if u.y != 0 and notdone:
			
			v.x = u.x
			v.z = u.z
			v.y = -(u.x*v.x + u.z*v.z) / u.y
			notdone = false
		if u.z != 0 and notdone:
			
			v.y = u.y
			v.z = u.z
			v.x = -(u.y*v.z + u.z*v.z) / u.z
			notdone = false	
	v = v.normalized()
		
	w = u.cross(v).normalized()
	
	
	
	
	
	clear()
	
	# Begin draw.
	begin(Mesh.PRIMITIVE_LINES)

	set_color(Color.black)
	# Prepare attributes for add_vertex.
	
	# Call last for each vertex, adds the above attributes.
	add_vertex(Vector3(Tail))

	set_color(Color.black)
	
	add_vertex(Vector3(Tail + Head))

	
	
	end()
	
	begin(Mesh.PRIMITIVE_TRIANGLES)
	var scale = .1
	set_color(Color.black)
	
	add_vertex(Vector3(Tail + Head))
	add_vertex(Vector3(Tail + Head - scale*u + scale*v + scale*w))
	add_vertex(Vector3(Tail + Head - scale*u + scale*v - scale*w))
	
	
	add_vertex(Vector3(Tail + Head))
	add_vertex(Vector3(Tail + Head - scale*u - scale*v + scale*w))
	add_vertex(Vector3(Tail + Head - scale*u - scale*v - scale*w))
	

	add_vertex(Vector3(Tail + Head))
	add_vertex(Vector3(Tail + Head - scale*u - scale*v + scale*w))
	add_vertex(Vector3(Tail + Head - scale*u + scale*v + scale*w))
	
	

	add_vertex(Vector3(Tail + Head))
	add_vertex(Vector3(Tail + Head - scale*u - scale*v - scale*w))
	add_vertex(Vector3(Tail + Head - scale*u + scale*v - scale*w))
	
	
	
	
	end()
	
# End drawing.
	
	
	
	
