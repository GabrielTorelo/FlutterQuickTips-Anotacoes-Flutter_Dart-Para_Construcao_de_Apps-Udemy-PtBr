import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function() responder;

  const Questionario(
      {super.key,
      required this.perguntaSelecionada,
      required this.perguntas,
      required this.responder});

  // Método para verificar se ainda existem perguntas a serem respondidas
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Lista de respostas
    final List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      // Usando Ctrl + . é possível envolver uma coluna em um Widget
      // children: Lista de widgets que serão exibidos na tela
      children: [
        // Questao: Widget que exibe a pergunta (criado em questao.dart)
        Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
        // Spread operator (...): Permite adicionar uma lista de widgets em outra lista de widgets
        // Mapeando a lista de respostas e retornando um widget para cada resposta
        ...respostas.map((textoResp) {
          return Resposta(
            texto: textoResp,
            funcao: responder,
          );
        }),
      ],
    );
  }
}
