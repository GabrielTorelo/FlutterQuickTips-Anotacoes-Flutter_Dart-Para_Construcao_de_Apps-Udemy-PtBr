void main() {
  // Lista de notas
  final List<double> notas = [8.2, 7.1, 6.8, 5.4, 3.2, 9.8, 9.0, 8.9, 7.3];

  // Função anônima que verifica se a nota é maior ou igual a 6, usando arrow function
  final bool Function(double) aprovados = (double nota) => nota >= 6;

  // Chama a função filtro passando a lista de notas e a função anônima
  final List<double> notasFiltradas = filtrar<double>(notas, aprovados);

  print("Notas: $notas");
  print("Notas aprovadas: $notasFiltradas");

  // Lista de nomes
  final List<String> nomes = ['João', 'Maria', 'Pedro', 'Ana', 'Carlos', 'Bia'];

  // Função anônima que verifica se o nome tem 5 letras ou mais, usando arrow function
  final bool Function(String) nomesGrandes = (String nome) => nome.length >= 5;

  // Chama a função filtro passando a lista de nomes e a função anônima
  final List<String> nomesFiltrados = filtrar<String>(nomes, nomesGrandes);

  print("Nomes grandes: $nomesFiltrados");
}

// Função filtro (where) genérica
List<T> filtrar<T>(List<T> notas, bool Function(T) fn) {
  List<T> listaFiltrada = [];
  for (T nota in notas) {
    if (fn(nota)) {
      listaFiltrada.add(nota);
    }
  }
  return listaFiltrada;
}
