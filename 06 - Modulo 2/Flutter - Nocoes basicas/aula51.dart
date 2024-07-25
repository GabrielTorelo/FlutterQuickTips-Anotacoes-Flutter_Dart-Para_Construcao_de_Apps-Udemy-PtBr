class Pessoa {
  String nome;
  String _cpf; // Atributo privado

  Pessoa(this.nome, this._cpf);

  String get getCpf {
    return this._cpf;
  }

  void setCpf(String cpf) {
    this._cpf = cpf;
  }
}

void main() {
  Pessoa pessoa = Pessoa('Gabriel', '111.111.111-11');
  print(pessoa.nome);

  // Consigo acessar o atributo privado no mesmo arquivo, mas não é recomendado
  print(pessoa._cpf);
}
