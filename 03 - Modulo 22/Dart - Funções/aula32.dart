// Função não genérica que retorna o segundo elemento de uma lista
Object segundoElementoV1(List lista) {
  return lista.length >= 2 ? lista[1] : null;
}

// Função genérica que retorna o segundo elemento de uma lista
E? segundoElementoV2<E>(List<E> lista) {
  return lista.length >= 2 ? lista[1] : null;
}

void main() {
  // Lista de inteiros e strings
  List<int> lista1 = [3, 6, 7, 13, 14, 20];
  List<String> lista2 = ['Ana', 'Bia', 'Carlos', 'Daniel'];
  List<int> lista3 = [3];

  // Devemos passar o "?" para indicar que o retorno pode ser nulo
  int? segundoElementoLista1 = segundoElementoV2<int>(lista1);
  String? segundoElementoLista2 = segundoElementoV2<String>(lista2);
  int? segundoElementoLista3 = segundoElementoV2<int>(lista3);

  print("Segundo elemento da lista1: $segundoElementoLista1");
  print("Segundo elemento da lista2: $segundoElementoLista2");
  print("Segundo elemento da lista3: $segundoElementoLista3");
}
