void main() {
  const int num1 = 5;
  const int num2 = 25;

  final int retorno = imprimeEretornaSoma(num1, num2);

  print("Retorno: $retorno");
  print("O dobro do retorno: ${retorno * 2}");
}

int imprimeEretornaSoma(int a, int b) {
  print("Soma: ${a + b}");
  return a + b;
}
