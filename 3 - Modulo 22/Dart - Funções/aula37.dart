void main() {
  final List<double> notas = [9.9, 9.3, 8.7, 5.1, 3.6, 4.8];
  double total = 0;

  // Somar todas as notas, usando o for in
  for (double nota in notas) {
    total += nota;
  }

  print("Notas: $notas");
  print("Total sem reduce : $total");

  // Somar todas as notas, usando o reduce
  final double Function(double, double) somar =
      (acumulador, nota) => acumulador + nota;

  final double totalReduce = notas.reduce(somar);

  print("Total com reduce: $totalReduce");
}
