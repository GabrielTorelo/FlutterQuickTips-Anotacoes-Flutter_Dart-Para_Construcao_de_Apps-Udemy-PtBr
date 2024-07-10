void main() {
  // Generics do tipo Lista de strings
  const List<String> objetos = ['Cadeira', 'Mesa', 'Sofá'];
  print("Os objetos são: $objetos");

  // Generics do tipo Mapa de inteiros e strings
  const Map<int, String> objetosMap = {1: 'Cadeira', 2: 'Mesa', 3: 'Sofá'};
  print("Os objetos são: $objetosMap");

  // Generics do tipo Set de strings
  const Set<String> objetosSet = {'Cadeira', 'Mesa', 'Sofá'};
  print("Os objetos são: $objetosSet");
}
