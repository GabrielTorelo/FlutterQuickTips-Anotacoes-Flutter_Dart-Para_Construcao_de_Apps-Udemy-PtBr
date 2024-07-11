// Função que recebe uma função e um número de vezes a ser executada
// É usado o "required" para garantir que as funções sejam passadas obrigatoriamente como parâmetros
void execVariasVezes(void Function({String nome}) fn,
    {required int vezes, String nome = ""}) {
  for (int i = 0; i < vezes; i++) {
    fn(nome: nome);
  }
}

void main() {
  execVariasVezes(olamundo, vezes: 3);
  execVariasVezes(saudacao, vezes: 2, nome: "Gabriel");
}

// Função que imprime "Olá mundo!"
void olamundo({String nome = ""}) =>
    nome.isEmpty ? print("Olá mundo!") : print("Olá mundo! Bem-vindo, $nome");

// Função que imprime saudação
void saudacao({String nome = ""}) =>
    nome.isEmpty ? print("Bom dia!") : print("Bom dia, $nome!");
