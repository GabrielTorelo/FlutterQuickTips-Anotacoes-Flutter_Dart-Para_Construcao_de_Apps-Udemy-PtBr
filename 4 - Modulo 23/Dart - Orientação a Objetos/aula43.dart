class Data {
  int dia = 1;
  int mes = 1;
  int ano;

  // Método construtor com parâmetros nomeados
  // Os parâmetros dia e mês são obrigatórios
  // O parâmetro ano é opcional, caso não seja passado, será 1970
  Data({required this.dia, required this.mes, this.ano = 1970});

  // Método construtor com corpo
  Data.ultimoDiaDoAno(int this.ano) {
    this.dia = 31;
    this.mes = 12;
  }

  // Sobrescrevendo o método toString
  String toString() {
    return "$dia/$mes/$ano";
  }
}

void main() {
  // Criando data de aniversário, passando todos os parâmetros
  Data dataAniversario = Data(dia: 24, mes: 03, ano: 2000);
  print("Data de aniversário: $dataAniversario");

  // Criando data de compra, sem passar nenhum parâmetro
  // Data dataCompra = Data();
  // Irá gerar um erro, pois os parâmetros dia e mês são obrigatórios

  // Criando data do fim da promoção, passando apenas o dia e o mês como parâmetro
  Data dataFimPromocao = Data(dia: 5, mes: 5);
  print("Data do fim da promoção: $dataFimPromocao");

  // Criando data do último dia do ano, passando apenas o ano como parâmetro
  Data dataUltimoDiaDoAno = Data.ultimoDiaDoAno(2024);
  print("Data do último dia do ano: $dataUltimoDiaDoAno");
}
