import 'package:flutter/material.dart';
import './questao.dart';
import 'resposta.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  // Método para responder a pergunta
  void _responder(int opcao) {
    // setState: Método que atualiza o estado do widget
    // O método build é chamado novamente
    setState(() {
      _perguntaSelecionada++;
      print('Resposta $opcao selecionada!');
    });
  }

  @override
  // O método build recebe um contexto e retorna um widget
  // Contexto: Informações sobre a árvore de widgets
  // Widget: Componente visual
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    // MaterialApp: Widget que configura o tema da aplicação
    return MaterialApp(
        // home: Widget que será exibido na tela
        home: Scaffold(
      // appBar: Barra superior
      appBar: AppBar(
        // title: Título da barra superior
        title: const Text('Perguntas'),
      ),
      // body: Corpo do aplicativo
      // Column: Widget que organiza os widgets em coluna
      body: Column(
        // Usando Ctrl + . é possível envolver uma coluna em um Widget
        // children: Lista de widgets que serão exibidos na tela
        children: [
          // Questao: Widget que exibe a pergunta (criado em questao.dart)
          Questao(texto: perguntas[_perguntaSelecionada]),
          // Resposta: Widgets que exibem as respostas (criado em resposta.dart)
          Resposta(texto: 'Resposta 1', opcao: 1, funcao: _responder),
          Resposta(texto: 'Resposta 2', opcao: 2, funcao: _responder),
          Resposta(texto: 'Resposta 3', opcao: 3, funcao: _responder),
        ],
      ),
    ));
  }
}

// Para que a classe PerguntaApp seja reconhecida como um widget
// É necessário que ela herde de "StatelessWidget" ou "StatefulWidget"
//
// StatelessWidget: Widget que não possui estado
// StatefulWidget: Widget que possui estado
//
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  // O decorator @override é opcional
  // Ele indentifica que o método abaixo está sobrescrevendo um método da classe pai (StatefulWidget)
  @override
  // O método createState é responsável por criar o estado do widget
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
