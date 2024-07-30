class Carro {
  // Atributo
  int _velocidade = 0;

  // Método para acelerar
  int acelerar() {
    this._velocidade += 5;

    return this._velocidade;
  }

  // Método para frear
  int frear() {
    this._velocidade -= 5;

    return this._velocidade;
  }
}

// Herança
// Classe Ferrari herda de Carro
class Ferrari extends Carro {}

// Herança
// Classe Gol herda de Carro
class Gol extends Carro {}

// Mixin => Forma de reutilizar código em várias classes
mixin Esportivo {
  // Atributo
  bool _turboLigado = false;

  // Método para ligar o turbo
  void ligarTurbo() {
    this._turboLigado = true;
  }

  // Método para desligar o turbo
  void desligarTurbo() {
    this._turboLigado = false;
  }
}

// Mixin => Forma de reutilizar código em várias classes
mixin Luxo {
  // Atributo
  bool _arCondicionadoLigado = false;

  // Método para ligar o ar condicionado
  void ligarAr() {
    this._arCondicionadoLigado = true;
  }

  // Método para desligar o ar condicionado
  void desligarAr() {
    this._arCondicionadoLigado = false;
  }
}

// Herança múltipla
// Classe FerrariTurbo herda de Ferrari e utiliza o mixin Esportivo
class FerrariTurbo extends Ferrari with Esportivo, Luxo {
  // Sobrescrita do método acelerar
  @override
  int acelerar() {
    if (this._turboLigado) {
      super.acelerar();
    } 

    return super.acelerar();
  }
}

void main() {
  // Instanciando um objeto do tipo Carro
  Carro c1 = Carro();
  
  print("A velocidade atual do carro é: ${c1.acelerar()} km/h");
  print("A velocidade atual do carro é: ${c1.acelerar()} km/h");
  print("A velocidade atual do carro é: ${c1.acelerar()} km/h");
  
  print("A velocidade atual do carro é: ${c1.frear()} km/h");
  print("A velocidade atual do carro é: ${c1.frear()} km/h");

  // Instanciando um objeto do tipo Ferrari
  Ferrari f1 = Ferrari();


  print("A velocidade atual da Ferrari é: ${f1.acelerar()} km/h");
  print("A velocidade atual da Ferrari é: ${f1.acelerar()} km/h");

  print("A velocidade atual da Ferrari é: ${f1.frear()} km/h");

  // Instanciando um objeto do tipo Gol
  Gol g1 = Gol();

  print("A velocidade atual do Gol é: ${g1.acelerar()} km/h");
  print("A velocidade atual do Gol é: ${g1.acelerar()} km/h");

  print("A velocidade atual do Gol é: ${g1.frear()} km/h");

  // Instanciando um objeto do tipo FerrariTurbo
  FerrariTurbo ft1 = FerrariTurbo();

  // Ligando o turbo da FerrariTurbo
  ft1.ligarTurbo();

  print("A velocidade atual da FerrariTurbo é: ${ft1.acelerar()} km/h");
  print("A velocidade atual da FerrariTurbo é: ${ft1.acelerar()} km/h");

  print("A velocidade atual da FerrariTurbo é: ${ft1.frear()} km/h");
}
