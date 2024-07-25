import 'dart:math';

void main() {
  print("Soma: ${soma(2, 3)}");
  print("Subtração: ${subtracao(10, 5)}");

  const int num1 = 5;
  const int num2 = 5;
  const int num3 = 50;
  const int num4 = 15;

  // Somando duas constantes
  print("Soma constantes: ${soma(num1, num2)}");

  // Usa o retorno da função 'subtracao' como parâmetro para a função 'soma'
  print("Soma 10 + sub: ${soma(10, subtracao(num3, num4))}");

  somaQualquerNumero(seed: 123);
  somaQualquerNumero();
}

int soma(int a, int b) {
  return a + b;
}

int subtracao(int a, int b) {
  return a - b;
}

// Função que soma dois números ""aleatórios"" gerados a partir de uma 'seed'
// O parâmetro "seed" é opcional e tem um valor padrão de 1000
void somaQualquerNumero({int seed = 1000}) {
  final int num1 = Random(seed * (seed ^ 2)).nextInt(1000);
  final int num2 = Random(seed * (seed ^ 3)).nextInt(1000);

  print("\nNúmero 1: $num1 | Número 2: $num2");
  print("Soma ambos (Número 1 + Número 2): ${soma(num1, num2)}");
}
