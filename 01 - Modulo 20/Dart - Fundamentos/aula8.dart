void main() {
  double num1 = 410;

  num1 += 5;

  print('O valor da variável "num1" é: $num1');

  num1 -= 15;

  print('O valor da variável "num1" agora é: $num1');

  num1 *= 2;

  print('O valor da variável "num1" agora é: $num1');

  num1 /= 3;

  // O método toStringAsFixed() é utilizado para formatar o número de casas decimais
  print('O valor da variável "num1" agora é: ${num1.toStringAsFixed(2)}');

  (num1 % 2) == 0
      ? print('Variável "num1" é par')
      : print('Variável "num1" é ímpar');

  num1 > 2
      ? print('Variável "num1" é maior que 2')
      : print('Variável "num1" é menor que 2');

  num1 < 100
      ? print('Variável "num1" é menor que 100')
      : print('Variável "num1" é maior que 100');

  num1 >= 200
      ? print('Variável "num1" é maior ou igual a 200')
      : print('Variável "num1" é menor que 200');

  num1 -= 0.6666666666667;

  num1 != 266
      ? print('Variável "num1" é diferente de 266')
      : print('Variável "num1" é igual a 266');

  int num2 = 5;
  int num3 = 4;

  // Comparação bit a bit
  // 101 = 5
  // 100 = 4
  // -------
  // 1 e 0 = 0
  // 0 e 0 = 0
  // 1 e 1 = 1
  // -------
  // 101 & 100 = 100 -> 4
  print(num2 & num3);
}
