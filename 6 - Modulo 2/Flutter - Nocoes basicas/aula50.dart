class Produto {
  String nome;
  double preco;

  // Método construtor
  Produto({required this.nome, required this.preco});

  // Método para retornar o nome do produto
  String pegaNome() {
    return nome;
  }

  // Método para aumentar o preço do produto
  double aumentaPreco(int porcentagem) {
    preco += preco * porcentagem / 100;

    return preco;
  }
}

void main() {
  // Instanciando objetos do tipo Produto
  // Não necessariamente precisa passar o "new" para instanciar um objeto
  var p1 = Produto(nome: "Lápis", preco: 2.55);
  var p2 = new Produto(nome: "Caneta", preco: 3.89);

  // Imprimindo os valores dos objetos
  print("Produto 1: ${p1.nome} - Preço: R\$ ${p1.preco.toStringAsFixed(2)}");
  print("Produto 2: ${p2.nome} - Preço: R\$ ${p2.preco.toStringAsFixed(2)}");

  // Chamando o método pegaNome
  print("Produto 1: ${p1.pegaNome()}");
  print("Produto 2: ${p2.pegaNome()}");

  // Chamando o método aumentaPreco
  print(
      "Preço do ${p1.nome} após aumento: R\$ ${p1.aumentaPreco(10).toStringAsFixed(2)}");
  print(
      "Preço do ${p2.nome} após aumento: R\$ ${p2.aumentaPreco(20).toStringAsFixed(2)}");
}
