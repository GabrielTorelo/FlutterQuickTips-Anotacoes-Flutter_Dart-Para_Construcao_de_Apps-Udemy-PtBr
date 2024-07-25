void main() {
  // Criando um mapa de notas (usando o conceito de chave/valor)
  // Chave: Nome do aluno
  // Valor: Nota do aluno
  const Map<String, double> notas = const {
    "João": 9.3,
    "Maria": 7.8,
    "Ana": 6.9,
    "Pedro": 9.1,
    "José": 8.4
  };

  // Laço for in, percorre o mapa de notas e imprime
  for (String nome in notas.keys) {
    print("1 - Nota do aluno(a) $nome é: ${notas[nome]}");
  }

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Laço for in, percorre o mapa de notas e imprime
  // Usando ".entries", temos acesso a chave e valor
  for (MapEntry<String, double> nota in notas.entries) {
    print("2 - Nota do aluno(a) ${nota.key} foi ${nota.value}");
  }
}
