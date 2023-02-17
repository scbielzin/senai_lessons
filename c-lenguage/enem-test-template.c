#include<stdio.h>
#include<conio.h>


void main() {

    char resposta[88]; //2 colunas com cod e nota
    char nome[3][30];//3 nomes de 30
    int gabarito[88] = {'c', 'e', 'd', 'b', 'd', 'd', 'd', 'c', 'a', 'c', 'c', 'b', 'd', 'a', 'e', 'b',
    'a', 'd', 'c', 'b', 'd', 'c', 'd', 'a', 'a', 'e', 'c', 'e', 'd', 'd', 'd', 'e', 'c', 'd', 'd', 'c', 'b', 'd', 'd', 'a', 'e',
    'd', 'c', 'c', 'a', 'e', 'b', 'c', 'c', 'c', 'c', 'c', 'a', 'c', 'c', 'd', 'a', 'b', 'c', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'b',
    'a', 'e', 'c', 'e', 'd', 'b', 'b', 'd', 'b', 'e', 'e', 'e', 'd', 'b', 'b', 'a', 'c', 'c', 'd', 'a', 'c'}; //gabarito;
    float media[3];
    int iqest = 91; //iterador mostrar pro usuario a quest�o;
    int acertos = 0;
    int aux, auxnom;

    //receber o c�digo, o nome de 100 candidatos ao ENEM 2020 e as respostas dos candidatos

    for(int i = 0; i < 3; i++) {
        printf("\nDigite o nome do candidato %i:", i); //le nome do candidato;
        scanf("%s",nome[i]);
        fflush(stdin); //desbuga

        for(int y = 0; y < 88; y++) { //for para cada [i] usu�rios, [y] quest�es
            printf("Resposta da quest�o %i:", y);
            resposta[y] = getchar();
            fflush(stdin);


            if(resposta[y] == gabarito[y]) {
                acertos++; //se resposta for igual resposta do gabarito/
            }
        }

        //no final de cada registro de candidato mostra os acertos e m�dia;
        printf("\nAcertos: %i", acertos);
        media[i] = (acertos * 100) / 88; //media em porcentagem
        printf("\nM�dia: %f %", media[i]);

        acertos = 0; //zera acertos

    }


    //organizador decrescente
    for(int i = 0; i < 3; i++) { //compara for i
        for(int x = 0; x < 3; x++){ //com for x
            if(media[i] > media[x]) { //e media[i] > media[x]
                aux = media[i];
                media[i] = media[x];
                media[x] = aux;

                for(int z = 0; z < 30; z++) {
                auxnom = nome[i][z];
                nome[i][z] = nome[x][z];
                nome[x][z] = auxnom;
                }

            }
        }
    }

    for(int i = 0; i < 3; i++) { //para cada m�dia
        printf("\nNome:");
        for(int y = 0; y < 30; y++){ //seu nome
            printf("%c", nome[i][y]);
        }
        printf(" M�dia: %f", media[i]);
    }
}
