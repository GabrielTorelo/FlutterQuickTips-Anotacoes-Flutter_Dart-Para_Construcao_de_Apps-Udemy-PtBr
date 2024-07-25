void main() {
  final List<double> notas = [8.2, 7.1, 6.8, 5.4, 3.2, 9.8, 9.0, 8.9, 7.3];

  // Passando a função como parâmetro para o método filtro (where)
  final List<double> aprovados = notas.where(aprovadosNaMateria).toList();

  print("Alunos aprovados: $aprovados");
}

// Função que filtra as notas
bool aprovadosNaMateria(double nota) {
  return nota >= 6;
}
