void main() {
  // Definindo uma variável de controle
  int indice = 0;
  for (; indice <= 10; indice++) {
    print("Valor do índice é: $indice");
  }

  print("Valor do índice (fora do laço) é: $indice");

  // Definindo a variável de controle dentro do for
  for (int i = 0; i <= 10; i++) {
    print("Valor do índice é: $i");
  }
}
