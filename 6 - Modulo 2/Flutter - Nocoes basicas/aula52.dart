import 'aula51.dart';

void main() {
  Pessoa pessoa = Pessoa('Gabriel', '111.111.111-11');
  print(pessoa.nome);

  // Não consigo acessar o atributo privado em outro arquivo
  // print(pessoa._cpf);

  // Consigo acessar o atributo privado através do método get
  print(pessoa.getCpf);

  // Não consigo alterar o atributo privado em outro arquivo
  // pessoa._cpf = '222.222.222-22';

  // Consigo alterar o atributo privado através do método set
  pessoa.setCpf('222.222.222-22');

  // Chamando o getter novamente para verificar a alteração
  print(pessoa.getCpf);
}
