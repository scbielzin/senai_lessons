void main() {
    double preco, total = 0;

    printf("Informe o pre�o: ");

    scanf("%f", &preco);

    while(preco > 0) {
        total = total + preco;

        printf("Informe o pre�o: ");
        scanf("%f", &preco);

    } //fim do bloco while

    printf("Total da compra: %f", total);
}
