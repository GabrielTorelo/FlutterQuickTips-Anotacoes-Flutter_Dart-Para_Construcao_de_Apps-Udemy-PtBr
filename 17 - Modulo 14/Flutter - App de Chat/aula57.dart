class Teste {
  static int value = 0;
}

void main() {
  // Quando a variável não é estática, é necessário instanciar a classe para acessar o valor
  // ---------------------------------------------------------------------------------------
  //
  // print(Teste().value);
  //
  // final Teste teste2 = Teste();
  // print(teste2.value);
  //
  // final Teste teste3 = new Teste();

  // Quando a variável é estática, é possível acessar o valor diretamente
  print(Teste.value);
}
