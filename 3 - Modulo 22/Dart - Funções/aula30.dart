// Função que retorna uma função anônima
Function({String p2}) funcaoFora({required String p1}) {
  print("Estou fora 1! $p1");
  print("Estou fora 2! $p1");
  print("Estou fora 3! $p1");

  return ({String p2 = ""}) {
    print("Estou dentro! $p2");
    print("Estou dentro! $p2");
    print("Estou dentro! $p2");
  };
}

void main() {
  final funcFora = funcaoFora(p1: "Blá blá blá");

  funcFora(p2: "Olá, estou dentro!");

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  final func = funcRetornaFunc(n1: 10);
  print("O resultado é: ${func(n2: 20)}");
}

// Função que retorna uma função anônima, usando arrow function
int Function({int n2}) funcRetornaFunc({required int n1}) =>
    ({int n2 = 0}) => n1 + n2;
