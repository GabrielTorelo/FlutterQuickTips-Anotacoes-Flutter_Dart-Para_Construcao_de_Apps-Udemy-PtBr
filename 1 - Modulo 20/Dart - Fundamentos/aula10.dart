import 'dart:io';

void main() {
  stdout.write("Está chovendo? (s/N) ");
  final String resp1 = stdin.readLineSync()!;
  final bool resp1Bool = resp1.toLowerCase() == "s";
  
  resp1Bool
      ? print("Está chovendo!")
      : print("Não está chovendo!");

  stdout.write("Está frio? (s/N) ");
  final bool resp2Bool = stdin.readLineSync()!.toLowerCase() == "s";

  resp2Bool
      ? print("Está frio!")
      : print("Não está frio!");

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  resp1Bool || resp2Bool
      ? print("Está frio ou chovendo! Melhor ficar em casa!")
      : print("O dia está ótimo para dar um passeio");
}
