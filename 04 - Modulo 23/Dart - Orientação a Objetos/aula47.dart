class Pessoa {
  String nome;
  int cpf;

  Pessoa(this.nome, this.cpf);
}

class Produto {
  String nome;
  double preco;

  Produto(this.nome, this.preco);

  double get precoComDesconto {
    return preco - (preco * 0.1);
  }
}

class Venda {
  Pessoa cliente;
  List<Produto> produtos;
  double _valorTotal = 0;

  Venda(
      {required this.cliente, required this.produtos, bool desconto = false}) {
    for (Produto produto in produtos) {
      if (desconto)
        this._setValorTotal = produto.precoComDesconto;
      else
        this._setValorTotal = produto.preco;
    }
  }

  String valorCompra() {
    return '\nO valor total da compra é R\$ ${this.getValorTotal.toStringAsFixed(2)}\n';
  }

  String gerarNotaFiscal() {
    return """
    .: Nota Fiscal :.
        Nome: ${cliente.nome}
        CPF: ${cliente.cpf}
        Itens comprados: ${produtos.map((e) => e.nome).toList()}
    Total: R\$ ${this.getValorTotal.toStringAsFixed(2)}""";
  }

  double get getValorTotal {
    return this._valorTotal;
  }

  void set _setValorTotal(double valor) {
    this._valorTotal += valor;
  }
}

void main() {
  var venda = Venda(
      cliente: Pessoa('João Aldo', 11111111112),
      produtos: [Produto('Lápis', 1.50), Produto('Caneta', 3.00)]);

  print(venda.gerarNotaFiscal());
  print(venda.valorCompra());

  var vendaDesconto = Venda(
      cliente: Pessoa('Gabriel Torelo', 11111111113),
      produtos: [
        Produto('Borracha', 2.00),
        Produto('Caderno', 20.00),
        Produto('Estojo', 10.00)
      ],
      desconto: true);
  print(vendaDesconto.gerarNotaFiscal());
  print(vendaDesconto.valorCompra());
}
