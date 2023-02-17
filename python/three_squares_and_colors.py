import turtle

t = turtle.Turtle()

def quadrado(tam, cor): #quadrado recebe tamanho e cor
    t.color(cor)
    t.fillcolor(cor)
    t.begin_fill() #preenche quadrado
    
    for i in range(0, 4): #traça quadrado
        t.right(90)
        t.forward(tam)

    t.end_fill()

def pula():   #def para distanciar um quadrado do outro
    t.penup()
    t.forward(110)
    t.pendown()

quadrado(90, "blue")
pula()
quadrado(90, "red")
pula()
quadrado(90, "green")


