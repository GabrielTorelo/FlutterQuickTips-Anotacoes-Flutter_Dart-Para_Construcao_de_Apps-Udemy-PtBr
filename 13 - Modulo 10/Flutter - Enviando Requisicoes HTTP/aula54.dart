void main() {
  // Funções síncronas
  int somatorio = soma(2, 3);
  print("O somatório é $somatorio");

  // Funções assíncronas
  print("Antes da chamada da função assincrona!");
  somaAsync(2, 3).then((value) => print("O 1º somatório assincrono é $value"));
  print("Depois da chamada da função assincrona!");

  // Encadeamento de funções assíncronas
  somaAsync(2, 3) // 2 + 3 = 5
      // O "then" recebe o valor retornado pela função assíncrona anterior
      .then(
    (soma1) {
      return somaAsync(soma1, 4); // 5 + 4 = 9
    },
    // O "onError" é chamado caso ocorra um erro, podendo obter o erro em cada "then"
    onError: (error) => print("Erro ao somar: $error"),
  ).then(
    (soma2) {
      // O "soma2" é o valor retornado pela função assíncrona anterior (9)
      print("O 2º somatório assincrono é $soma2");
      return somaAsync(soma2, 5); // 9 + 5 = 14
    },
    // O "onError" é chamado caso ocorra um erro, podendo obter o erro em cada "then"
    onError: (error) => print("Erro ao somar: $error"),
  ).then(
    (soma3) {
      // O "soma3" é o valor retornado pela função assíncrona anterior (14)
      print("O 3º somatório assincrono é $soma3");
      return soma3;
    },
    // O "onError" é chamado caso ocorra um erro, podendo obter o erro em cada "then"
    onError: (error) => print("Erro ao somar: $error"),
  )
      // Caso ocorra um erro em qualquer "then", o "catchError" é chamado
      .catchError((error) => print("Erro ao somar: $error"));
}

// Função síncrona que retorna um int
int soma(int a, int b) {
  return a + b;
}

// Função assíncrona que retorna um Future<int>
Future<int> somaAsync(int a, int b) async {
  // O retorno da função é um Future<int>, pois a função é assíncrona
  return Future(
    // O Future é resolvido com a soma de a e b
    () => a + b,
  );
}
