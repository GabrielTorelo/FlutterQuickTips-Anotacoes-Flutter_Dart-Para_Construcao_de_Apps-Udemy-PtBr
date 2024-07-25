import 'dart:math';

// Função que recebe duas funções (como parâmetros nomeados) e executa uma delas de forma aleatória
// É usado o "required" para garantir que as funções sejam passadas obrigatoriamente como parâmetros
void exec({required Function fn1, required Function fn2}) {
  final int n = Random().nextInt(10);
  print("O valor sorteado foi: $n");

  n % 2 == 0 ? fn1(n) : fn2(n);
}

void main() {
  exec(fn1: fnPar, fn2: fnImpar);
}

// Função Par -> Espera receber um valor posicional inteiro
void fnPar([int numero = 0]) => print('O valor "$numero" é par');

// Função Ímpar -> Espera receber um valor posicional inteiro
void fnImpar([int numero = 0]) => print('O valor "$numero" é ímpar');
