void main() {
  int idade = 24;
  double altura = 1.80;
  var nome = "Gabriel";
  bool maiorDeIdade = true;
  dynamic variavel = 1;
  var anoNascimento = DateTime.now().year - idade;

  print(
      "Nome: $nome, Idade: $idade, Altura: $altura, Maior de Idade: $maiorDeIdade, Variável: $variavel");
  print("O tipo da variável 'nome' é: ${nome.runtimeType}");
  print("Ano de nascimento: $anoNascimento");
  print("O tipo da variável 'idade' agora é: ${idade.toString().runtimeType}");
  print("Variável 'nome' é do tipo String? ${nome is String}");
  print("Variável 'nome' é vazia? ${nome.isEmpty}");
}
