import 'dart:math';

void main() {
  final int numero = Random().nextInt(101);

  print("Número sorteado: $numero");

  if (numero % 2 == 0)
    print("O número $numero é par");
  else if (numero % 2 != 0)
    print("O número $numero é ímpar");
  else
    print("O número $numero é neutro");

  if (numero % 3 == 0) print("O número $numero é múltiplo de 3");
  // Como o print não está dentro do bloco if, ele será executado sempre, mesmo estando abaixo do if
  print("Executado sempre");
}
