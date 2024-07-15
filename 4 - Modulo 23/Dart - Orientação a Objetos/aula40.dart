class Carro {
  int velocidadeMaxima = 120;
  int velocidadeAtual = 0;

  // Método para acelerar o carro
  int acelerar() {
    this.velocidadeAtual += 5;

    if (this.velocidadeAtual > this.velocidadeMaxima) {
      this.velocidadeAtual = this.velocidadeMaxima;
      print("Velocidade máxima atingida!");
      return 0;
    }

    return this.velocidadeAtual;
  }

  // Sobrescrevendo o método toString
  @override
  String toString() {
    return "Carro com velocidade máxima de ${this.velocidadeMaxima} km/h";
  }
}

void main() {
  // Instanciando a classe Carro
  final Carro carro = Carro();

  // Constante para definir a quantidade de acelerações
  const acelearacoes = 27;

  print("Tentando acelerar o carro ${acelearacoes} vezes.\n");

  // Acelerando o carro
  for (int i = 0; i < acelearacoes; i++) {
    // Chamando o método para acelerar o carro
    int aceleracao = carro.acelerar();

    // Verificando se a aceleração foi possível
    if (aceleracao == 0) {
      print("\nFoi possível acelerar o carro ${i} vezes.");
      break;
    }

    // Imprimindo a aceleração
    print("Aceleração ${i + 1}: ${aceleracao} km/h");
  }

  // Imprimindo a velocidade máxima
  print(carro);
}
