#Bismillahirrahmanirrahim
extends Spatial
var ek = load("res://kodlar/ek.gd").new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cordX = Array()
var cordZ = Array()
var parents = Array()
var Swidth
var SHeight
var start
var end
var enoOfPath = true
var exitToProgram = false


# Called when the node enters the scene tree for the first time.
func _ready():
	Swidth = $yer.transform.basis.get_scale().x - 3
	SHeight = $yer.transform.basis.get_scale().z - 3
	start = ek.randPoint(Swidth, SHeight)
	end = ek.randPoint(Swidth, SHeight)
	ek.drawStartEnd(start, end)
	cordX.append(start.x)
	cordZ.append(start.z)
	parents.append(0)
	#for n in range(90):
	#	ek.addNode(Swidth, SHeight, cordX, cordZ, parents)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#ek.drawLine(ek.randPoint(Swidth, SHeight), ek.randPoint(Swidth, SHeight))
	#print(ek.randPoint(Swidth, SHeight))
	if enoOfPath:
		enoOfPath = ek.addNode(Swidth, SHeight, cordX, cordZ, parents, end, 3)
	elif not exitToProgram:
		exitToProgram = ek.shortestPath(cordX, cordZ, parents)


func _on_Timer_timeout():
	#ek.addNode(Swidth, SHeight, cordX, cordZ, parents,end)
	pass
