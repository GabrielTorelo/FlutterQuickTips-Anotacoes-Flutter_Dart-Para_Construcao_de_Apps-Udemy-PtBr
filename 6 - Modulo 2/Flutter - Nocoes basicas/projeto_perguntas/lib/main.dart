import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  // Método para responder a pergunta
  void responder({required int opcao}) {
    // setState: Método que atualiza o estado do widget
    // O método build é chamado novamente
    setState(() {
      perguntaSelecionada++;
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
          // Text: Widget que exibe um texto
          Text(perguntas[perguntaSelecionada]),
          // ElevatedButton: Botão com elevação
          ElevatedButton(
            // onPressed: Evento que será executado ao clicar no botão
            onPressed: () => responder(opcao: 1),
            // child: Texto do botão
            child: const Text('Resposta 1'),
          ),
          // ElevatedButton: Botão com elevação
          ElevatedButton(
            // onPressed: Evento que será executado ao clicar no botão
            onPressed: () => responder(opcao: 2),
            // child: Texto do botão
            child: const Text('Resposta 2'),
          ),
          // ElevatedButton: Botão com elevação
          ElevatedButton(
            // onPressed: Evento que será executado ao clicar no botão
            onPressed: () => responder(opcao: 3),
            // child: Texto do botão
            child: const Text('Resposta 3'),
          ),
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
  // O decorator @override é opcional
  // Ele indentifica que o método abaixo está sobrescrevendo um método da classe pai (StatefulWidget)
  @override
  // O método createState é responsável por criar o estado do widget
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
