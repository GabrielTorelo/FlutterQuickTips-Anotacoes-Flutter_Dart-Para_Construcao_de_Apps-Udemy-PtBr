class Motor {
  String tipo;

  Motor(this.tipo);

  void ligar() {
    print("Motor $tipo ligado");
  }
}

class Carro {
  String modelo;
  Motor motor; // Composição

  Carro(this.modelo, this.motor);

  void ligarCarro() {
    print('Ligando o carro modelo "$modelo"');
    motor.ligar();
  }
}

void main() {
  Carro carro = Carro("Fusca", Motor("2.0"));
  carro.ligarCarro();
}
