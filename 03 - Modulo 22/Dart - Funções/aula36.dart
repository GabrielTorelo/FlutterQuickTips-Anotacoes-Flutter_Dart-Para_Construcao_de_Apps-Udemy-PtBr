void main() {
  final List<Map<String, dynamic>> alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Mariana', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.8},
  ];

  final String Function(Map<String, dynamic>) pegaNomeFn =
      (aluno) => aluno['nome'];
  final int Function(String) qtdLetrasFn = (texto) => texto.length;

  final Iterable<String> nomeAlunos = alunos.map(pegaNomeFn);
  final Iterable<int> quantidadeDeLetras = nomeAlunos.map(qtdLetrasFn);

  final Map<String, int> juntaNomeQuantidade = {
    for (String nome in nomeAlunos) nome: qtdLetrasFn(nome)
  };

  print("Nomes dos alunos: $nomeAlunos");
  print("Quantidade de letras de cada nome: $quantidadeDeLetras");
  print("Nome e quantidade de letras: $juntaNomeQuantidade");

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  final int Function(int) dobro = (numero) => numero * 2;
  final Iterable<int> dobroQtdLetras = quantidadeDeLetras.map(dobro);

  print("Dobro da quantidade de letras: $dobroQtdLetras");
}
