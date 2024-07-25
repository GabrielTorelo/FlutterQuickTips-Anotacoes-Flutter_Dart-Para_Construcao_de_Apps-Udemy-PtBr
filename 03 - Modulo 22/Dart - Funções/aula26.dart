void main() {
  // Funções anônimas
  final int Function(int, int) somar = soma;
  final int Function(int, int) subtrair = subtracao;
  final int Function(int, int) multiplicar = multiplicacao;
  final double Function(int, int) dividir = divisao;

  print('A soma 1 é: ${somar(10, 5)}');
  print('A subtração é: ${subtrair(10, 5)}');
  print('A multiplicação é: ${multiplicar(10, 5)}');
  print('A divisão é: ${dividir(10, 5)}');

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Função anônima na propria variável, usando arrow function
  final int Function(int, int) somar2 = (a, b) => a + b;

  // Função anônima na propria variável, não inferindo o tipo
  final somar3 = (int a, int b) => a + b;

  print('A soma 2 é: ${somar2(50, 45)}');
  print('A soma 3 é: ${somar3(50, 45)}');

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Função anônima usando parâmetros nomeados e valores padrão
  final somar4 = ({int a = 0, int b = 0}) => a + b;

  // Função anônima usando parâmetros posicionais e valores padrão
  final somar5 = ([int a = 0, int b = 0]) => a + b;

  print('A soma 4 é: ${somar4(b: 10)}');
  print('A soma 5 é: ${somar5(5)}');
}

int soma(int a, int b) => a + b;
int subtracao(int a, int b) => a - b;
int multiplicacao(int a, int b) => a * b;
double divisao(int a, int b) => a / b;
