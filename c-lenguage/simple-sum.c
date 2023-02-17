#include <stdio.h>
void main() {
    int num1, num2;

    printf("Digite o primeiro valor:");
    scanf("%i", &num1);
    printf("Digite o segundo valor:");
    scanf("%i", &num2);

    printf("Total %i", (num1 + num2) * num1);
}
