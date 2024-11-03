class Counter {
  // O static é um modificador que faz com que a variável seja
  // compartilhada entre todas as instâncias da classe.
  static int value = 1;

  // Não precisamos mais de um construtor privado, pois a variável é estática.
  // -------------------------------------------------------------------------
  //
  // static final instance = Counter._();
  // Counter._();

  int increment() {
    // Utilizamos o operador de incremento ++ para incrementar o valor.
    // Pré-fixado (++value) incrementa o valor e retorna o novo valor.
    return ++value;
  }
}

void main() {
  print(Counter().increment());
  print(Counter().increment());
  print(Counter().increment());
}
