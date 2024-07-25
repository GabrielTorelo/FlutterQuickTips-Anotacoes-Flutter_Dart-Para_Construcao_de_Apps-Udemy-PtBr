import 'dart:math';

void main() {
  // O parâmetro maximo é nomeado, ou seja, é passado com o nome do parâmetro
  final int n1 = retornaNumeroAleatorio(maximo: 100);
  final int n2 = retornaNumeroAleatorio();

  print("Número aleatório 1: $n1");
  print("Número aleatório 2: $n2");

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  imprimirData(11, 07, 2024);
  imprimirData();

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  imprimirData2(dia: 11, mes: 07, ano: 2024);
  imprimirData2();

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  imprimirData3(11, 07, 2024);
  imprimirData3(11);
}

// Função que retorna um número aleatório
// O parâmetro maximo é opcional, caso não seja passado, o valor padrão é 1000
// Por conta das "{}" o parâmetro é nomeado
int retornaNumeroAleatorio({int maximo = 1000}) {
  return Random().nextInt(maximo);
}

// Função que imprime a data
// Os parâmetros são opcionais, caso não sejam passados, os valores padrão são 1/1/1970
// Por conta dos "[]", os parâmetros são posicionais
void imprimirData([int dia = 1, int mes = 1, int ano = 1970]) =>
    print("Data 1: $dia/$mes/$ano");

// Por conta dos "{}", os parâmetros são nomeados
void imprimirData2({int dia = 1, int mes = 1, int ano = 1970}) =>
    print("Data 2: $dia/$mes/$ano");

// Dia é obrigatório, mes e ano são opcionais
// Por conta dos "[]", os parâmetros são posicionais
void imprimirData3(int dia, [int mes = 1, int ano = 1970]) =>
    print("Data 3: $dia/$mes/$ano");
