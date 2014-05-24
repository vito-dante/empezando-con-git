import turtle

#tamano
#normal 
#mediano
#grande

while True:
	print("---------------------------")
	print("Que tamano quieres imprimir")
	print("1.- Pequeno")
	print("2.- Mediano")
	print("3.- Grande")
	print("4.- Muy_grande")
	numero=int(input("Cual eliges  "))
	if numero==1:
		a=0.50
		break
	elif numero==2:
		a=1
		break
	elif numero==3:
		a=1.5
		break
	elif numero==4:
		a=2
		break
	else:
		print("No esta en el menu")
	pass

turtle.setup(800, 600)
wn = turtle
wn.bgcolor("lightgreen")
wn.title("Vito")

lapiz = turtle.Turtle()
lapiz.shape("turtle")
lapiz.color("blue")

lapiz.penup()
lapiz.backward(100*a)
lapiz.pendown()
#posicionando
lapiz.pensize(5*a)
#color
lapiz.right(75)
lapiz.forward(100*a)
lapiz.left(150)
lapiz.forward(100*a)
lapiz.right(75)
#esta realizada la v
lapiz.color("red")
lapiz.penup() 
lapiz.forward(37*a)
lapiz.right(90)
lapiz.forward(90*a)
lapiz.right(180)
lapiz.pendown()
lapiz.forward(60*a)
lapiz.penup()
lapiz.forward(25*a)
lapiz.right(90)
lapiz.forward(10*a)
lapiz.left(90)
lapiz.pendown()
lapiz.circle(15*a)
#acabado la i
lapiz.color("black")
lapiz.penup()
lapiz.right(90)
lapiz.forward(45*a)
lapiz.left(90)
lapiz.backward(85*a)
lapiz.pendown()
lapiz.forward(75*a)
lapiz.penup()
lapiz.forward(5*a)
lapiz.right(90)
lapiz.forward(25*a)
lapiz.pendown()
lapiz.backward(50*a)
#acabado la t
lapiz.color("yellow")
lapiz.penup()
lapiz.forward(65*a)
lapiz.right(90)
lapiz.forward(40*a)
lapiz.pendown()
lapiz.circle(35*a)
wn.exitonclick()
#acabado la o