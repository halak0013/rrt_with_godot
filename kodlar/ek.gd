#Bismillahirrahmanirrahim
extends Node

var c=Color(0, 0, 1)
func randPoint(Swidth, SHeight):
	randomize()
	return Vector3(rand_range(-Swidth, Swidth), 0.15, rand_range(-SHeight, SHeight))


func drawLine(v1, v2):
	#randP, smaller
	add_child(DarwLine3d.DrawLine(v1, v2, c))

func exitP(v1, end):
	#print(distance(v1, end))
	if distance(v1, end) < 2:
		print("başarılı")
		return true
	else:
		return false


func distance(v1: Vector3, v2: Vector3):
	
	return sqrt(pow(v1.x - v2.x, 2) + pow(v1.z - v2.z, 2))


func drawStartEnd(vs: Vector3, ve: Vector3):
	add_child(DarwLine3d.DrawCube(vs, 1, Color(0, 0.5, 0.5)))
	add_child(DarwLine3d.DrawCube(ve, 1, Color(1, 0.4, 0)))




func addNode(Swidth, SHeight, cordx, cordz, parents,end,minD):
	var randP = randPoint(Swidth, SHeight)
	var smaller = Vector3(cordx[0], 0.15, cordz[0])
	var n=0
	var a= distance(randP, Vector3(cordx[0], 0.15, cordz[0]))
	var b

	
	var xp
	var zp
	#print("-----------------------------")
	for p in range(len(cordx) - 1):
		b = distance(randP, Vector3(cordx[p], 0.15, cordz[p]))
		#print("a ",a," b ",b)
		if a > b:
			smaller = Vector3(cordx[p], 0.15, cordz[p])
			a=b
			#print("seçilen    a ",a," b ",b)
			n = p
			#print(n)

	parents.append(n)
	var dis = distance(smaller, randP)
	xp = (minD*(randP.x-smaller.x))/dis+smaller.x
	zp = (minD*(randP.z-smaller.z))/dis+smaller.z
	cordx.append(xp)
	cordz.append(zp)
	#add_child(DarwLine3d.DrawCube(randP, 0.2, Color(0, 0.5, 0)))
	drawLine(smaller,Vector3(xp,0.15,zp))
	return not exitP(Vector3(xp,0.15,zp),end)

func shortestPath(cordx, cordz, parents):
	c=Color(1,0,0)
	var v=Vector3(cordx[-1],0.15,cordz[-1])
	var n=parents[-1]
	while true:
		drawLine(v,Vector3(cordx[n],0.15,cordz[n]))
		v=Vector3(cordx[n],0.15,cordz[n])
		if n==0:
			break
		print(n)
		n=parents[n]
		print(n)
	return true

