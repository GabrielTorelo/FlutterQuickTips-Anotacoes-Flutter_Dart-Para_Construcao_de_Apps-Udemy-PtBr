void main() {
  const int a = 10;
  const int b = 3;
  const double resultado = a / b;

  print("O resultado da divisão é: ${resultado.toStringAsFixed(2)}");

  const bool resultadoBool = a % b == 0;

  print("O resultado da divisão é inteiro: $resultadoBool");

  const bool estaChovendo = true;
  const bool estaFrio = false;

  print("\nEstá chovendo e está frio: ${estaChovendo && estaFrio}");

  // Lista de Strings
  final List<String> nomes = ["Ana", "Bia", "Carlos"];

  print("\nO primeiro nome é: ${nomes[0]}");
  print("O tamanho da lista é: ${nomes.length}");

  // Caso fosse definido como const, não seria possível adicionar elementos
  nomes.add("Daniel");

  print("Elemento adicionado: ${nomes[3]}");
  print("O tamanho da lista é: ${nomes.length}");

  // Set de inteiros
  final Set<int> numeros = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

  print("\nO conjunto tem ${numeros.length} elementos");

  numeros.clear();

  print("Agora o conjunto tem ${numeros.length} elementos");

  // Mapa de Strings e inteiros
  final Map<String, int> idades = {
    "Ana": 25,
    "Bia": 20,
    "Carlos": 30,
  };

  print("\nA idade do Carlos é: ${idades["Carlos"]} ano(s)");

  // Percorrendo o mapa e exibindo as chaves e os valores
  idades.forEach((nome, idade) {
    print("A idade de $nome é $idade ano(s)");
  });
}
