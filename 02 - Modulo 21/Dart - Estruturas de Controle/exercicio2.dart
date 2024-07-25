// Usando o laço de repetição "for", crie o modelo abaixo:
// IMPORTANTE: Sem controlar o laço usando valor númerico!
// #
// ##
// ###
// ####
// #####

void main() {
  print("Usando valor numérico para controlar o laço");
  for (int i = 1; i <= 5; i++) {
    print('#' * i);
  }

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  print("Usando uma lista para controlar o laço");
  const List<String> caracteres = const ['#', '##', '###', '####', '#####'];

  for (String caracter in caracteres) {
    print(caracter);
  }

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  print(
      "Interando sobre uma string para controlar o laço (comparação de tamanho)");
  for (String valor = '#'; valor.length <= 5; valor += '#') {
    print(valor);
  }

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  print(
      "Interando sobre uma string para controlar o laço (comparação de string)");
  for (String valor = '#'; valor != '######'; valor += '#') {
    print(valor);
  }
}
