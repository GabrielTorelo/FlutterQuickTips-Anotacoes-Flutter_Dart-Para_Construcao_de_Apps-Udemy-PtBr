void main() {
  final List<Map<String, dynamic>> alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Mariana', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.8},
  ];

  final double total = alunos
      .map((aluno) => aluno['nota'])
      .reduce((acumulador, atual) => acumulador + atual);

  print("O valor total das notas é: $total");
  print("A média das notas é: ${total / alunos.length}");
}
