void main() {
  // Função anônima na propria variável, usando função normal
  final somar = (int a, int b) {
    return a + b;
  };

  // Função anônima na propria variável, usando arrow function
  final subtrair = (int a, int b) => a - b;

  print('A soma é: ${somar(10, 5)}');
  print('A subtração é: ${subtrair(15, 5)}');
}
