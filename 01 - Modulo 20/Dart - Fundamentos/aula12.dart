void main() {
  const String nome = 'Gabriel';
  const String sobrenome = 'Torelo';
  const int idade = 24;
  const double altura = 1.80;

  // Interpolação de strings usando o simbolo de adição
  final String frase1 = '1 - Nome: ' +
      nome +
      ' ' +
      sobrenome +
      ', Idade: ' +
      idade.toString() +
      ', Altura: ' +
      altura.toString() +
      ' metros';
  print(frase1);

  // Interpolação de strings usando o simbolo de cifrão
  // Usando o cifrão, não é necessário converter as variáveis para string
  const String frase2 =
      '2 - Nome: $nome $sobrenome, Idade: $idade, Altura: $altura metros';
  print(frase2);

  // Interpolação de strings usando o simbolo de cifrão diretamente no print
  print('3 - Nome: $nome $sobrenome, Idade: $idade, Altura: $altura metros');

  // Interpolação de strings usando o simbolo de cifrão e chaves
  print(
      '4 - Nome: ${nome} ${sobrenome}, Idade: ${idade}, Altura: ${altura + 0.20} metros');
}
