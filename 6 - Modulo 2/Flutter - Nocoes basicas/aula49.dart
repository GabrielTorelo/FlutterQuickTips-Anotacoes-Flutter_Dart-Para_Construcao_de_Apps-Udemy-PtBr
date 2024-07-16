// Função para somar dois inteiros
int somaInteiro(int a, int b) {
  return a + b;
}

// Função para somar dois doubles
void somaDouble(double a, double b) {
  print(a + b);
}

// Função para somar dois valores dinamicos
dynamic soma(dynamic a, dynamic b) {
  return a + b;
}

// Função para executar uma função passada como parâmetro
int exec(int a, int b, int Function(int, int) fn) {
  return fn(a, b);
}

void main() {
  double a = 10.8;
  double b = 3.5;

  // Não é possível passar double para a função soma
  // Pois, a função soma espera dois inteiros
  // soma(a, b)
  somaDouble(a, b);

  print("Soma: ${somaInteiro(10, 3)}");

  // Como a função soma aceita qualquer tipo de dado
  // Podemos passar double para ela
  print("Soma: ${soma(a, b)}");
  print("Soma: ${soma(10, 3)}");

  // Passando uma função como parâmetro
  print("Soma: ${exec(10, 3, somaInteiro)}");
}
