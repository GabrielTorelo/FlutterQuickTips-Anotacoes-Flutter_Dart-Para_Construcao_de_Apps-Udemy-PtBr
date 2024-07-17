import 'package:flutter/material.dart';
import './questao.dart';
import 'resposta.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['⚫ Preto', '🔴 Vermelho', '🟢 Verde', '⚪ Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['🐇 Coelho', '🐍 Cobra', '🐘 Elefante', '🦁 Leão'],
    },
    {
      'texto': 'Qual é o seu veiculo favorito?',
      'respostas': ['🚗 Carro', '🚲 Bicicleta', '✈️ Avião', '🚢 Navio'],
    },
  ];

  // Método para responder a pergunta
  void _responder() {
    if (temPerguntaSelecionada) {
      // setState: Método que atualiza o estado do widget
      // O método build é chamado novamente
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  // O método build recebe um contexto e retorna um widget
  // Contexto: Informações sobre a árvore de widgets
  // Widget: Componente visual
  Widget build(BuildContext context) {
    // Lista de respostas
    final List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    // MaterialApp: Widget que configura o tema da aplicação
    return MaterialApp(
        // home: Widget que será exibido na tela
        home: Scaffold(
            // appBar: Barra superior
            appBar: AppBar(
                // title: Título da barra superior
                title: const Text('Perguntas'), // Setando o texto do título
                backgroundColor: Colors.blue, // Setando a cor de fundo
                centerTitle: true, // Centraliza o título
                titleTextStyle: const TextStyle(
                  color: Colors.white, // Setando a cor do texto
                  fontSize: 20, // Setando o tamanho da fonte
                  fontWeight: FontWeight.bold, // Setando o peso da fonte
                )),
            // body: Corpo do aplicativo
            // Column: Widget que organiza os widgets em coluna
            body: temPerguntaSelecionada
                ? Column(
                    // Usando Ctrl + . é possível envolver uma coluna em um Widget
                    // children: Lista de widgets que serão exibidos na tela
                    children: [
                      // Questao: Widget que exibe a pergunta (criado em questao.dart)
                      Questao(
                          texto: _perguntas[_perguntaSelecionada]['texto']
                              .toString()),
                      // Spread operator (...): Permite adicionar uma lista de widgets em outra lista de widgets
                      // Mapeando a lista de respostas e retornando um widget para cada resposta
                      ...respostas.map((textoResp) {
                        return Resposta(
                          texto: textoResp,
                          funcao: _responder,
                        );
                      }),
                    ],
                  )
                : const Center(
                    child: Text(
                      'Parabéns!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )));
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
