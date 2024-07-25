// Criar uma classe chamada "Carro" que receba a velocidade máxima.
// Possua um método chamado "acelerar" que receba um parâmetro chamado "delta" que irá incrementar a velocidade do carro.
// Possua um método chamado "frear" que irá decrementar a velocidade do carro.
// Possua um método chamado "estaNoLimite" que irá retornar se o carro está ou não no limite de sua velocidade máxima.
// O carro não pode andar mais rápido que a velocidade máxima.
// O carro não pode andar mais devagar que 0.

class Carro {
  int velocidadeMaxima;
  int velocidadeAtual = 0;

  Carro(this.velocidadeMaxima);

  int acelerar(int delta) {
    this.velocidadeAtual += delta;

    if (this.velocidadeAtual > this.velocidadeMaxima) {
      this.velocidadeAtual = this.velocidadeMaxima;
      print("Velocidade máxima atingida!");
      return 0;
    }

    return this.velocidadeAtual;
  }

  int frear(int delta) {
    this.velocidadeAtual -= delta;

    if (this.velocidadeAtual <= 0) {
      this.velocidadeAtual = 0;
      print("O carro parou!");
      return 0;
    }

    return this.velocidadeAtual;
  }

  bool estaNoLimite() {
    return this.velocidadeAtual == this.velocidadeMaxima;
  }

  String toString() {
    return "Velocidade atual: ${this.velocidadeAtual} km/h";
  }
}

void main() {
  Carro carro = Carro(200);

  // Constante para definir a quantidade de acelerações
  const acelearacoes = 50;

  // Constante para definir a quantidade de frenagens
  const frenagens = 45;

  print("Tentando acelerar o carro ${acelearacoes} vezes.");

  // Acelerando o carro
  for (int i = 0; i < acelearacoes; i++) {
    // Chamando o método para acelerar o carro
    int aceleracao = carro.acelerar(5);

    // Verificando se a aceleração foi possível
    if (aceleracao == 0) {
      print("Foi possível acelerar o carro ${i} vezes.");
      break;
    }

    // Imprimindo a aceleração
    print("Aceleração ${i + 1}: ${aceleracao} km/h");
  }

  // --------------------------------------------
  print("\n");
  // --------------------------------------------

  print("Tentando frear o carro ${frenagens} vezes.");

  // Freando o carro
  for (int i = 0; i < frenagens; i++) {
    // Chamando o método para frear o carro
    int freio = carro.frear(5);

    // Verificando se a frenagem foi possível
    if (freio == 0) {
      print("Foi possível frear o carro ${i} vezes.");
      break;
    }

    // Imprimindo a frenagem
    print("Frenagem ${i + 1}: ${freio} km/h");
  }
}
