void main() {
  final List<double> notas = [8.2, 7.1, 6.8, 5.4, 3.2, 9.8, 9.0, 8.9, 7.3];

  // Sem usar filtro (where)
  List<double> aprovados1 = [];
  for (double nota in notas) {
    if (nota >= 6) {
      aprovados1.add(nota);
    }
  }

  // Usando filtro (where)
  final List<double> aprovados2 = notas.where((nota) => nota >= 6).toList();

  print("Alunos aprovados 1: $aprovados1");
  print("Alunos aprovados 2: $aprovados2");
}
