import 'dart:io';

void main() {
  // Laço while, enquanto "a" for menor que 10
  int a = 0;
  while (a <= 10) {
    print('O valor de "a" é: $a');
    a++;
  }

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Laço while, enquanto "opcao" for diferente de 'sair'
  // O laço só será finalizado quando o usuário digitar 'sair'
  // Caso o valor da variável "opcao" seja inicializado com 'sair', o laço não será executado
  String opcao = '';
  while (opcao.toLowerCase() != 'sair') {
    stdout.write("Digite a opção ('sair' para finalizar): ");
    opcao = stdin.readLineSync()!;
  }

  print("Você saiu do laço while!");

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Laço "do while", executa pelo menos uma vez
  int num1 = 0;
  do {
    num1++;
    print('O valor de "num1" é: $num1');

    if (num1 < 10) {
      stdout.write("Digite 'sair' para finalizar: ");
      opcao = stdin.readLineSync()!;
    } else {
      opcao = 'sair';
    }
  } while (opcao.toLowerCase() != 'sair');
}
