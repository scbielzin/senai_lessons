void main() {
    int valor, i=0, pares=0, impares=0;

    while(i < 5) {
    printf("Digite um valor: ");
    scanf("%i", &valor);

    if(valor % 2 == 0) {
        pares++;
    } else if(valor % 2 == 1) {
        impares++;
    }
        i++;

    }

    printf("Pares: %i", pares);
    printf("\nImpares: %i", impares);




}
