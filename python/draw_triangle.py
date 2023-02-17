import turtle

t = turtle.Turtle()


t.penup() ##posição primeiro triangulo
t.sety(0)
t.right(180)
t.setx(-90)
t.pendown()

def triangulo(tam): #função faz triangulo
    for i in range(0, 3):
        t.right((360/3))
        t.forward(tam)

triangulo(90)

t.penup() #posição segundo triangulo
t.setx(-45)
t.sety(78)
t.pendown()

triangulo(90) #posição terceiro triangulo


t.penup()
t.setx(0)
t.sety(0)
t.pendown()

triangulo(90)
