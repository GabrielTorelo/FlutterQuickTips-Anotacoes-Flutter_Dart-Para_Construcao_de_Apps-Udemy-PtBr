void main() {
  final String nomeCompleto =
      retornaNomeCompleto(nome: 'Gabriel', sobrenome: 'Torelo');
  final String nomeCompleto2 = retornaNomeCompleto();
  final String nomeCompleto3 =
      retornaNomeCompleto(sobrenome: 'Torelo', nome: 'Gabriel');
  final String nomeCompleto4 = retornaNomeCompleto(sobrenome: 'Torelo');
  final String nomeCompleto5 = retornaNomeCompleto(nome: 'Gabriel');

  print(nomeCompleto);
  print(nomeCompleto2);
  print(nomeCompleto3);
  print(nomeCompleto4);
  print(nomeCompleto5);

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  final String nomeCompleto6 =
      retornaNomeCompleto2('Gabriel', sobrenome: 'Torelo');
  final String nomeCompleto7 = retornaNomeCompleto2('Gabriel');

  print(nomeCompleto6);
  print(nomeCompleto7);
}

// Função que retorna o nome completo
// Os parâmetros são opcionais, caso não sejam passados, os valores padrão são "SEM NOME" e "SEM SOBRENOME"
// Por conta dos "{}", os parâmetros são nomeados
String retornaNomeCompleto(
        {String nome = "SEM NOME", String sobrenome = "SEM SOBRENOME"}) =>
    "$nome $sobrenome";

// O parâmetro nome é obrigatório, o parâmetro sobrenome é opcional
// Caso o sobrenome não seja passado, o valor padrão é "SEM SOBRENOME"
// Por conta dos "{}", o parâmetro é nomeado
String retornaNomeCompleto2(String nome,
        {String sobrenome = "SEM SOBRENOME"}) =>
    "$nome $sobrenome";
