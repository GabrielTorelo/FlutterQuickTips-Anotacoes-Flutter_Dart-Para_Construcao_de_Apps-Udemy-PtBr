void main() {
  const Set<int> numeros = {0, 20, 40, 100, 200, 320};

  // Laço de repetição "for"
  // Percorre todos os elementos da lista "numeros"
  // Não imprime o valor 100 e interrompe o laço ao encontrar o valor 200
  for (int numero in numeros) {
    // Verifica se a variável é igual a 100
    // Caso seja, chama novamente o laço, pulando a execução do código abaixo
    if (numero == 100) {
      continue;
    }

    // Verifica se a variável é igual a 200
    // Caso seja, interrompe o laço, não executando o restante do código dentro do laço
    if (numero == 200) {
      print("Número é 200");
      break;
    }

    print("Número: $numero");
  }

  print("\nFim do programa");
}
