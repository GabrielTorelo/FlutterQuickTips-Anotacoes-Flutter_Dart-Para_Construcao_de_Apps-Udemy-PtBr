void main() {
  const int num1 = 7;
  const int num2 = 3;
  const int resultado1 = num1 + num2;
  const int resultado2 = num1 - num2;
  const int resultado3 = num1 * num2;
  const double resultado4 = num1 / num2;
  const int resultado5 = num1 % num2;

  print('O resultado da soma é: $resultado1');
  print('O resultado da subtração é: $resultado2');
  print('O resultado da multiplicação é: $resultado3');

  // O método toStringAsFixed() é utilizado para formatar o número de casas decimais
  print('O resultado da divisão é: ${resultado4.toStringAsFixed(2)}');

  print('O resultado do resto da divisão é: $resultado5');

  resultado5 == 0
      ? print('Variável "resultado5" é par')
      : print('Variável "resultado5" é ímpar');

  const bool ehFragio = true;
  const bool ehCaro = false;

  ehFragio
      ? print("O produto é Frágio")
      : print("O produto é Resistente");

  ehCaro
      ? print("O produto é Caro")
      : print("O produto é Barato");

  ehFragio && ehCaro
      ? print("O produto é Frágio e Caro")
      : print("O produto é Resistente e Barato");

  ehFragio ^ ehCaro
      ? print("O produto é Frágio ou Caro")
      : print("O produto é Frágio e Caro ou é Resistente e Barato");

  !ehFragio ? print("O produto é Resistente") : '';
  !ehCaro ? print("O produto é Barato") : '';

  !!ehCaro ? print("O produto é Caro") : '';
}
