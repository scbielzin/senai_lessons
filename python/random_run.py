import turtle
import random

t1 = turtle.Turtle()
t2 = turtle.Turtle()

t1.penup()
t1.sety(20) #vai pra cima da t2
t1.pendown()

def corrida(distancia): #função corrida
    for i in range(0, 4):
        t1.speed(random.randrange(1, 2))
        t1.forward(distancia/random.randrange(1, 4))
        t2.speed(random.randrange(1, 2))
        t2.forward(distancia/random.randrange(1, 4))

        if t1.xcor() >= 250:
            print("T1 Ganhou")
            break
        elif t2.xcor() >= 250:
            print("T2 Ganhou")
            break

corrida(250) #chama função corrida