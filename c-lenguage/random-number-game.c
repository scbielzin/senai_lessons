#include <stdio.h>
//Jogo da adivinha��o, 5 tentativas de encontrar o n�mero de random!
int main() {

    int random = rand() % 100;
    printf("%d", random);
    int tentativa = 0;
    int valorUser;

    do {

        printf("\nDigite uma tentativa 'N�mero Inteiro':");
        scanf("%d", &valorUser);

        if(valorUser > random) {
            printf("\nO valor � menor que %d", valorUser);
        }

        else if(valorUser < random) {
            printf("\nO valor � maior que %d", valorUser);
        }

        else if(valorUser == random) {
            return printf("\nVoc� acertou!!");
            break;
        }

        tentativa++;
    } while(tentativa <= 5);

    printf("Voc� perdeu todas tentativas! N�mero secreto: %d", random);

}

