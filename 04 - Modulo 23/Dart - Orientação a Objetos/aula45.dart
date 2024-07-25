class Pessoa {
  String nome;
  int _cpf = 0; // Atributo privado

  // Método Construtor
  Pessoa({required this.nome, required int cpf}) {
    // Chamando o método Setter e passando o CPF informado (método privado)
    this._setCPF = cpf;
  }

  void imprimirCPF() {
    // Verificando se o CPF é igual a 0, caso seja, exibe uma mensagem de erro
    if (this.getCPF == 0)
      print('CPF não informado');
    else
      print('CPF: ${this.getCPF}');
  }

  // Método Getter
  int get getCPF {
    // Retornando o CPF, que é um atributo privado
    return this._cpf;
  }

  // Método Setter (método privado)
  void set _setCPF(int cpf) {
    // Verificando se o CPF informado é válido antes de atribuir
    if (cpf.toString().length == 11 && cpf != 11111111111)
      this._cpf = cpf;
    else
      print('CPF inválido');
  }
}

void main() {
  Pessoa pessoa = Pessoa(nome: 'Fagner', cpf: 11111111111);
  pessoa.imprimirCPF();

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  Pessoa pessoa2 = Pessoa(nome: 'José', cpf: 11111111112);
  pessoa2.imprimirCPF();
}
