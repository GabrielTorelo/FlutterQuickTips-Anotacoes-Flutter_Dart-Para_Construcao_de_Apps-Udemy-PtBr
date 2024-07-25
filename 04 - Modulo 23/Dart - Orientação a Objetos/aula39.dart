class DataSimples {
  int dia;
  int mes;
  int ano;

  // Método construtor
  // Como os parâmetros são obrigatórios, é necessário utilizar o required
  DataSimples({required this.dia, required this.mes, required this.ano});

  // Sobrescrevendo o método toString
  @override
  String toString() {
    return "${this.dia}/${this.mes}/${this.ano}";
  }
}

// Classe sem método construtor
class Data2 {
  // Por conta do Null Safety, é necessário inicializar as variáveis
  int dia = 0;
  int mes = 0;
  int ano = 0;

  // Método que retorna a data formatada
  String retornaDataFormatada() {
    return "${this.dia}/${this.mes}/${this.ano}";
  }
}

void main() {
  // Instanciando as classes - Pode criar uma instância passando o 'new' ou não
  final DataSimples dataNascimento = DataSimples(dia: 24, mes: 03, ano: 2000);
  final Data2 dataCompra = new Data2();

  // Atribuindo valores para as variáveis da classe Data2
  dataCompra.dia = 13;
  dataCompra.mes = 07;
  dataCompra.ano = 2024;

  print("Data de nascimento: ${dataNascimento}");
  print("Data da compra: ${dataCompra.retornaDataFormatada()}");
}
