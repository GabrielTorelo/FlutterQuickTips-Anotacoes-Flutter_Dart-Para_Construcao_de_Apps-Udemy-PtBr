void main() {
  const double nota = 6.88;
  final notaArredondada = nota.roundToDouble();
  final notaTruncada = nota.truncateToDouble();

  print("Nota arredondada: $notaArredondada");
  print("Nota truncada: $notaTruncada");

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  const String saudacao = "Bom dia";
  const String nomeCompleto = "Gabriel Torelo";
  final String nome = nomeCompleto.substring(0, 7);
  final String saudacaoComNome = "$saudacao, $nome";

  print(saudacaoComNome.toUpperCase());
  print(saudacaoComNome.padRight(20, "!").toUpperCase());

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  print("Gabriel".substring(0, 4).toUpperCase() +
      "Gabriel".substring(4).toLowerCase());
}
