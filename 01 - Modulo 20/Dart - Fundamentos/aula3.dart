import 'dart:io';
import 'dart:math';

void main() {
  const int idade = 24;
  // Gera um erro, pois a variável é constante (não pode ser alterada)
  // idade = 20;

  final double altura;
  altura = 1.80;
  // Gera um erro, pois a variável é final (não pode ser alterada após a atribuição)
  // altura = 1.90;

  const double PI = pi;

  print("Idade: $idade, Altura: $altura");

  // Calcular a área de um círculo
  void calcularAreaCirculo(double raio) {
    final double area = PI * raio * raio;

    print("A área do círculo é: $area");
  }

  // Necessita de tratamento de exceção, pois, o usuário pode informar um valor inválido (ex: "a")
  // Caso seja informado um valor inválido durante a conversão de String para double ocorrerá um erro
  try {
    stdout.write("Informe o raio do círculo: ");
    final double raio = double.parse(stdin.readLineSync()!);

    calcularAreaCirculo(raio);
  } catch (e) {
    if (e is FormatException)
      print("Erro ao converter o valor informado para um número real.");
    else
      print("Erro ao ler o raio do círculo. Error: $e");
  }
}
