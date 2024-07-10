void main() {
  const List<double> notas = const [9.3, 7.8, 6.9, 9.1, 8.4];

  // Laço for, percorre a lista de notas e imprime
  // Usando o for, temos acesso ao índice, porem é mais complexo
  for (int i = 0; i < notas.length; i++) {
    print("[For] - Nota do aluno é: ${notas[i]}");
  }

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Laço for in, percorre a lista de notas e imprime
  // Usando o for in, não temos acesso ao índice, porem é mais simples
  for (double n in notas) {
    print("[For in] - Nota do aluno é: $n");
  }

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Criando uma lista de listas de coordenadas
  const List<List<double>> coordenadas = const [
    [41.40338, 2.17403],
    [48.8566, 2.3522],
    [55.7558, 37.6176],
    [40.7128, -74.0060],
    [37.7749, -122.4194]
  ];

  // Percorrendo a lista de listas
  for (List<double> coordenada in coordenadas) {
    // Verificando se não é a primeira coordenada
    if (coordenadas.indexOf(coordenada) != 0) {
      print("\n");
    }

    print("Coordenadas do local: $coordenada");

    // Percorrendo a lista mais interna
    for (double coord in coordenada) {
      if (coordenada.indexOf(coord) == 0) {
        // Imprimindo coordenadas no eixo x
        print("Coordenada x: $coord");
      } else {
        // Imprimindo coordenadas no eixo y
        print("Coordenada y: $coord");
      }
    }
  }
}
