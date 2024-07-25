// Descubra qual o problema do código abaixo e corrija-o.

void main() {
  const nota = 3.0;

  print("A nota do aluno é $nota.");

  // O problema é que o ponto e vírgula após o if faz com que o bloco de código abaixo
  // seja executado independente da condição, ou seja, o bloco de código abaixo do if
  // será executado independente do valor da variável nota.
  if (nota >= 6.0) ;
  {
    print("\nParabéns! Você foi aprovado!");
  }

  print("Fim do programa");
}
