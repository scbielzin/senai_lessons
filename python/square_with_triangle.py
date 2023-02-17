import turtle

t = turtle.Turtle()

def quadrado(tam): #faz quadrado
    for i in range(0, 4):
        t.right(90)
        t.forward(tam)


quadrado(90)

t.penup() #desaparece e vai para posição do canto do quadrado
t.sety(0)
t.right(180)
t.setx(-90)
t.pendown()

def triangulo(tam): #faz triangulo
    for i in range(0, 3):
        t.right((360/3))
        t.forward(tam)

triangulo(90)