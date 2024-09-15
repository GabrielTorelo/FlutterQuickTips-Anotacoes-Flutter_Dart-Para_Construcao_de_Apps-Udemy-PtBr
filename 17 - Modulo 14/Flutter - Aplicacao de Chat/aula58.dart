import 'dart:async';

void main() {
  // O Stream é uma sequência de eventos ordenados que ocorrem ao longo do tempo.
  // --------------------
  // O método periodic cria um Stream que emite valores a cada período de tempo especificado.
  final s1 = Stream<int>.periodic(
    const Duration(seconds: 2), // O período de tempo entre os eventos.
    (i) => i + 1, // Função que é chamada para cada evento.
  ).take(10); // Limita o número de eventos que o Stream emite.

  // O método listen é usado para ouvir os eventos de um Stream.
  s1.listen(
    (value) {
      print("S1 - Value: $value");
    },
    // O parâmetro onError é chamado quando um erro ocorre no Stream.
    onError: (error) {
      print("S1 - Error: $error");
    },
  );

  // O método multi cria um Stream que emite uma sequência de valores.
  final s2 = Stream<int>.multi(
    (controller) {
      // Adiciona 10 eventos ao Stream.
      for (var i = 0; i < 10; i++) {
        controller
            .add(i); // O método add é usado para adicionar um evento ao Stream.
      }

      // O método addError é usado para adicionar um erro ao Stream.
      controller.addError("I added an error at the end of the Stream!");

      // O método close é usado para fechar o Stream.
      // Depois de fechado, nenhum outro evento pode ser adicionado ao Stream.
      controller.close();
    },
  );

  // O método listen é usado para ouvir os eventos de um Stream.
  s2.listen(
    (value) {
      print("S2 - Value: $value");
    },
    // O parâmetro onError é chamado quando um erro ocorre no Stream.
    onError: (error) {
      print("S2 - Error: $error");
    },
  );

  final s3 = Stream<int>.multi(
    (controller) {
      // O Timer é usado para agendar a execução de uma função em um momento futuro.
      Timer.periodic(
        const Duration(seconds: 1), // O período de tempo entre os eventos.
        (timer) {
          // O método add é usado para adicionar um evento ao Stream.
          controller.add(timer
              .tick); // O tick é o número de vezes que o Timer foi disparado.

          if (timer.tick >= 10) {
            timer.cancel(); // O método cancel é usado para cancelar o Timer.

            // O método close é usado para fechar o Stream.
            // Depois de fechado, nenhum outro evento pode ser adicionado ao Stream.
            controller.close();
          }
        },
      );
    },
  );

  // O método listen é usado para ouvir os eventos de um Stream.
  s3.listen(
    (value) {
      print("S3 - Value: $value");
    },
    // O parâmetro onError é chamado quando um erro ocorre no Stream.
    onError: (error) {
      print("S3 - Error: $error");
    },
  );

  // Criando um Stream a partir de uma coleção de elementos.
  // O método fromIterable cria um Stream a partir de uma coleção de elementos.
  Stream<String> streamStrings = Stream.fromIterable(["1", "2", "3", "a", "b"]);

  StreamTransformer<String, int> convertStringToInt =
      // O método fromHandlers é usado para criar um StreamTransformer.
      StreamTransformer<String, int>.fromHandlers(
    // O handleData é chamado para cada evento que o Stream emite.
    handleData: (String data, EventSink<int> sink) {
      // O 'sink' é usado para adicionar eventos ao Stream.
      sink.add(int.parse(data)); // Converte String para int
    },
  );

  // O método transform é usado para transformar um Stream.
  // O método transform recebe um StreamTransformer (convertStringToInt) como parâmetro.
  Stream<int> streamInts = streamStrings.transform(convertStringToInt);

  // O método listen é usado para ouvir os eventos de um Stream.
  streamInts.listen(
    (value) {
      print("StreamInts - Value: $value");
    },
    // O parâmetro onError é chamado quando um erro ocorre no Stream.
    onError: (error) {
      print("StreamInts - Error: ${error.toString()}");
    },
  );
}
