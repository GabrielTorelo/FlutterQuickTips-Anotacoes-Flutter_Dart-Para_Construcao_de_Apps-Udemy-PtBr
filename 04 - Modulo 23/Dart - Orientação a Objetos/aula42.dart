class Data {
  int dia = 1;
  int mes = 1;
  int ano = 1970;

  // Método construtor com parâmetros opcionais
  Data([int dia = 1, int mes = 1, int ano = 1970]) {
    this.dia = dia;
    this.mes = mes;
    this.ano = ano;
  }
}

void main() {
  // Criando data de aniversário, passando todos os parâmetros
  Data dataAniversario = Data(24, 03, 2000);
  String dataAniversarioFormatada =
      "${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano}";
  print("Data de aniversário: $dataAniversarioFormatada");

  // Criando data de compra, sem passar nenhum parâmetro
  Data dataCompra = Data();
  String dataCompraFormatada =
      "${dataCompra.dia}/${dataCompra.mes}/${dataCompra.ano}";
  print("Data da compra: $dataCompraFormatada");

  // Criando data do fim da promoção, passando apenas o dia e o mês como parâmetro
  Data dataFimPromocao = Data(5, 5);
  String dataFimPromocaoFormatada =
      "${dataFimPromocao.dia}/${dataFimPromocao.mes}/${dataFimPromocao.ano}";
  print("Data do fim da promoção: $dataFimPromocaoFormatada");
}
