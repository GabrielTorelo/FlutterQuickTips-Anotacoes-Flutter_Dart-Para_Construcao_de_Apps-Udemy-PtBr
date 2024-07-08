void main() {
  const int n1 = -10;
  const double n2 = 20.5;
  final double n3 = n1 + n2;
  final double n5 = 10.5;

  print("Valor da variável 'n1': $n1");
  print("Valor da variável 'n2': $n2");
  print("Resultado da soma entre 'n1' e 'n2': $n3");
  print("Valor da variável 'n5': $n5");

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // A variável 'n4' é do tipo 'num', ou seja, ela pode receber tanto valores inteiros quanto valores decimais.
  num n4 = 6;
  print(
      'Inicialmente, o valor da variável "n4" é $n4 e o tipo é: ${n4.runtimeType}');

  n4 += 0.5;
  print(
      'Após a adição de 0.5, o valor da variável "n4" é $n4 e o tipo é: ${n4.runtimeType}');

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // O método 'abs()' retorna o valor absoluto de um número, ou seja, o valor sem o sinal negativo.
  print("Valor absoluto da variável 'n1': ${n1.abs()}");

  // O método 'ceil()' retorna o menor número inteiro que é maior ou igual ao número passado como argumento.
  print("Valor de 'n5' arredondado para cima: ${n5.ceil()}");

  // O método 'floor()' retorna o maior número inteiro que é menor ou igual ao número passado como argumento.
  print("Valor de 'n5' arredondado para baixo: ${n5.floor()}");
}
