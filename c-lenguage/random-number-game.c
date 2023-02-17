#include <stdio.h>
//Jogo da adivinhação, 5 tentativas de encontrar o número de random!
int main() {

    int random = rand() % 100;
    printf("%d", random);
    int tentativa = 0;
    int valorUser;

    do {

        printf("\nDigite uma tentativa 'Número Inteiro':");
        scanf("%d", &valorUser);

        if(valorUser > random) {
            printf("\nO valor é menor que %d", valorUser);
        }

        else if(valorUser < random) {
            printf("\nO valor é maior que %d", valorUser);
        }

        else if(valorUser == random) {
            return printf("\nVocê acertou!!");
            break;
        }

        tentativa++;
    } while(tentativa <= 5);

    printf("Você perdeu todas tentativas! Número secreto: %d", random);

}

