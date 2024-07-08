void main() {
  const List<String> nomes = ['Daniel', 'Mari', 'João', 'Pedro', 'Maria'];
  const List<String> telefones = [
    '+55 11 999999999',
    '+55 11 888888888',
    '+55 11 777777777',
    '+55 11 666666666',
    '+55 11 555555555'
  ];

  print("A variável nomes é do tipo: ${nomes.runtimeType}");
  print("A variável telefones é do tipo: ${telefones.runtimeType}");

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Acessando o primeiro elemento da lista.
  print("Primeiro elemento da lista: ${nomes.elementAt(0)}");
  print("Outras formas de acessar o primeiro elemento da lista:");
  print('Usando ".first" -> ${nomes.first}');
  print('Usando "[0]" -> ${nomes[0]}');
  print('Usando ".elementAt(0)" -> ${nomes.elementAt(0)}');

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Realizando um tratamento de erro. Caso o índice não exista, será exibido uma mensagem de erro.
  try {
    // Tentando acessar um índice que não existe.
    print("Item inexistente: ${nomes.elementAt(5)}");
  } catch (e) {
    if (e is RangeError)
      // Caso o erro seja do tipo RangeError, exibir a mensagem de erro.
      print("Erro ao tentar acessar um índice que não existe.");
    else
      print(
          "Erro inesperado! Erro: $e"); // Caso contrário, exibir a mensagem "Erro inesperado: $e
  }

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Mapeando os nomes e telefones para criar uma agenda.
  final Map<String, String> agenda;

  // O método "fromIterables" cria um mapa a partir de duas listas
  // Onde a primeira lista é utilizada como chave e a segunda como valor.
  agenda = Map.fromIterables(nomes, telefones);
  print("Agenda: $agenda");

  print("A variável agenda é do tipo: ${agenda.runtimeType}");

  print("O telefone de Daniel é: ${agenda['Daniel']}");

  print("A agenda contém a chave 'Daniel'? ${agenda.containsKey('Daniel')}");
  print(
      "A agenda contém o valor '+55 11 999999999'? ${agenda.containsValue('+55 11 999999999')}");

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  // Criando um conjunto (coleção não ordenada) de notas.
  // O conjunto não permite elementos duplicados.
  // Os elementos repetidos são ignorados (não serão adicionados ao conjunto).
  // --------------------------------------------
  // ignore: equal_elements_in_set
  final Set<double> notas = {9.5, 8.2, 7.0, 10.0, 9.5, 8.2, 7.0, 10.0};
  notas.add(9.8);
  notas.add(7.0);
  print("Notas: $notas");

  print("Primeira nota: ${notas.first}");
  print("Ultima nota: ${notas.last}");
}
