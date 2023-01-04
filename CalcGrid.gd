extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var GridDivision = 1.0
var GridExtent = 3.0
var Vectors = []
var expression = Expression.new()
var Fxyz = 1.0
var Gxyz = 1.0
var Hxyz = 1.0
var x = 0.0
var y = 0.0
var z = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$"../UI/VectorF/Fxyz".connect("text_entered",self,"_onFxyz_text_entered")
	$"../UI/VectorF/Gxyz".connect("text_entered",self,"_onGxyz_text_entered")
	$"../UI/VectorF/Hxyz".connect("text_entered",self,"_onHxyz_text_entered")
	
	#var aa = preload("res://Vector.tscn")
	var aa = preload("res://Arrow.tscn")

	for i in range(2.0 * GridExtent / GridDivision +1):
		Vectors.append([])	
		for j in range(2.0 * GridExtent / GridDivision +1 ):
			Vectors[i].append([])
			for k in range(2.0 * GridExtent / GridDivision +1):
				Vectors[i][j].append([])
				Vectors[i][j][k] = aa.instance()
				#Vectors[i][j][0].init(Vector3(i*GridDivision - GridExtent,j*GridDivision - GridExtent,0),+Vector3(1,1,1))
				self.add_child(Vectors[i][j][k])
	update_vectors($"../UI/VectorF/Fxyz".text,$"../UI/VectorF/Gxyz".text,$"../UI/VectorF/Hxyz".text)
#	var x = -GridExtent
#
#	while x < GridExtent:
#	#for i in range(-GridExtent,GridExtent+GridDivision,GridDivision):
#		var y = -GridExtent
#		while y < GridExtent:
##					for j in range(-GridExtent,j GridExtent+GridDivision,GridDivision):
#			if x == 0 and y == 0:
#				break
#			var a = load("res://Vector.tscn")
#			var b = a.instance()
#			self.add_child(b)
#			b.init(Vector3(x,y,0),+Vector3(Fxyz,0,0))
#
#			#print(i,"  ",j)
#			y += GridDivision
#
#		x += GridDivision
	pass # Replace with function body.

func _onFxyz_text_entered(Fcommand):
	var Gcommand = $"../UI/VectorF/Gxyz".text
	var Hcommand = $"../UI/VectorF/Hxyz".text
	update_vectors(Fcommand,Gcommand,Hcommand)
	
func _onGxyz_text_entered(Gcommand):
	var Fcommand = $"../UI/VectorF/Fxyz".text
	var Hcommand = $"../UI/VectorF/Hxyz".text
	update_vectors(Fcommand,Gcommand,Hcommand)
	
func _onHxyz_text_entered(Hcommand):
	var Fcommand = $"../UI/VectorF/Fxyz".text
	var Gcommand = $"../UI/VectorF/Gxyz".text
	update_vectors(Fcommand,Gcommand,Hcommand)


func update_vectors(Fcommand,Gcommand,Hcommand):
	for i in range(2.0 * GridExtent / GridDivision +1):
		x = i*GridDivision - GridExtent
		for j in range(2.0 * GridExtent / GridDivision +1):
			y = j*GridDivision - GridExtent
			for k in range(2.0 * GridExtent / GridDivision +1):
				z = k*GridDivision - GridExtent
				#if not (x == 0 and y == 0 and z == 0):
					
				var error = expression.parse(Fcommand,["x","y","z"])
				if error != OK:
					print(expression.get_error_text())
					return
				var  result = expression.execute([x,y,z],null,true)
				if not expression.has_execute_failed():
					Fxyz = result
	#					print(x,"  ",y,"  ",z)
	#					print("Fxyz = ",Fxyz)
	#					print()
				else:
					print(expression.get_error_text())
				
				error = expression.parse(Gcommand,["x","y","z"])
				if error != OK:
					print(expression.get_error_text())
					return
				result = expression.execute([x,y,z],null,true)
				if not expression.has_execute_failed():
					Gxyz = result
	#					print(x,"  ",y,"  ",z)
	#					print("Gxyz = ",Gxyz)
	#					print()
				else:
					print(expression.get_error_text())
					
				error = expression.parse(Hcommand,["x","y","z"])
				if error != OK:
					print(expression.get_error_text())
					return
				result = expression.execute([x,y,z],null,true)
				if not expression.has_execute_failed():
					Hxyz = result
#					print(x,"  ",y,"  ",z)
#					print("Hxyz = ",Hxyz)
#					print()
				else:
					print(expression.get_error_text())
				
				#Vectors[i][j][0].init(Vector3(x,y,z),+Vector3(Fxyz,Gxyz,Hxyz))
				
				print(Fxyz,"  ",Gxyz,"  ",Hxyz)
#				Fxyz = 1
#				Gxyz = 1
#				Hxyz = 1
				Vectors[i][j][k].transform = Transform.looking_at(Vector3(Fxyz,Gxyz,Hxyz).normalized(),Vector3(0,1,0))
				#Vectors[i][j][k].rotate(Vector3(0,1,0), 3.14)
				Vectors[i][j][k].transform.origin = Vector3(x,y,z)
				
				Vectors[i][j][k].scale.x = Vector3(Fxyz,Gxyz,Hxyz).length()
				Vectors[i][j][k].scale.y = Vectors[i][j][k].scale.x 
				Vectors[i][j][k].scale.z = Vectors[i][j][k].scale.x
		#else:
			#Vectors[i][j][0].init(Vector3(x,y,z),+Vector3(0.1,0.1,0.1))
		#	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
