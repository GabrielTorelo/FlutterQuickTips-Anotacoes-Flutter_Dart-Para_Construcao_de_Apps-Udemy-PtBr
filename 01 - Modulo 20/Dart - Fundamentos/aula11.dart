void main() {
  final List<String> frutas = ['banana', 'maçã', 'uva'];
  // Caso seja colocado const após o igual (antes da lista), não será possível adicionar novos elementos
  // final List<String> frutas = const ['banana', 'maçã', 'uva'];

  frutas.add('laranja');

  print("Lista de frutas: $frutas");
}
