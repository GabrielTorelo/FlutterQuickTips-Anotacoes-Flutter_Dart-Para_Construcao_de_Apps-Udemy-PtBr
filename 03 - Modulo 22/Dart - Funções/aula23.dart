void main() {
  final int junt1 = juntar(1, 9);
  final String junt2 = juntar("Bom ", "dia!!");
  final String junt3 = juntar("O valor de PI é ", 3.1415);

  print('\nO valor de "junt1" é: ${junt1.runtimeType.toString()} -> $junt1');
  print('\nO valor de "junt2" é: ${junt2.runtimeType.toString()} -> $junt2');
  print('\nO valor de "junt3" é: ${junt3.runtimeType.toString()} -> $junt3');
}

dynamic juntar(dynamic a, dynamic b) {
  print(a.toString() + b.toString());

  if (a is int && b is int)
    return a + b;
  else
    return a.toString() + b.toString();
}
