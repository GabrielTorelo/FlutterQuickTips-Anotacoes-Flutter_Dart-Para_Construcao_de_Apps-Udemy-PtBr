class Data {
  int dia = 1;
  int mes = 1;
  int ano = 1970;

  // Método construtor com parâmetros posicionais
  Data(int dia, int mes, int ano) {
    // O 'this' é necessário para diferenciar as variáveis locais das variáveis da classe (possuem o mesmo nome)
    // Em alguns casos o 'this' é opcional, mas é uma boa prática sempre utilizá-lo
    this.dia = dia;
    this.mes = mes;
    this.ano = ano;
  }

  // Sobrescrevendo o método toString
  @override
  String toString() {
    return "${this.dia}/${this.mes}/${this.ano}";
  }
}

void main() {
  Data dataAniversario = Data(24, 03, 2000);
  String dataAniversarioFormatada =
      "${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano}";
  print("Data de aniversário: $dataAniversarioFormatada");

  Data dataCompra = Data(13, 07, 2024);
  print("Data da compra: $dataCompra");
}
