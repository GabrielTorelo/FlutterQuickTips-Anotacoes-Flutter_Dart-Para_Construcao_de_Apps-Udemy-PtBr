import 'dart:math';

void main() {
  final int numero = Random().nextInt(102);

  print("Número sorteado: $numero");

  // Estrutura condicional "if" multipla
  // Testa o valor da variável "numero" multiplas vezes e executa o bloco de código correspondente
  // Necessário utilizar o "break" para finalizar o case, caso contrário, o código continuará executando
  switch (numero) {
    case 0:
      print("Número é 0");
      break; // Obrigatório para finalizar o case
    case 20:
    case 40:
      print("Número é 20 ou 40");
      break; // Obrigatório para finalizar o case
    case 100:
      print("Número é 100");
      break; // Obrigatório para finalizar o case
    default:
      print("Número não é 0 nem é 100");
    // Como o "default" é o último case, não é necessário utilizar o "break"
  }

  // Para trabalhar com intervalos, é necessário utilizar a estrutura condicional "if"
  if (numero >= 0 && numero <= 50) {
    print("Número está entre 0 e 50");
  } else if (numero > 50 && numero <= 100) {
    print("Número está entre 51 e 100");
  } else {
    print("Número não está entre 0 e 100");
  }
}
