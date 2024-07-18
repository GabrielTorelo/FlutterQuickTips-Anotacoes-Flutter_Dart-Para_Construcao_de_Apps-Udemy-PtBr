import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': List<Map<String, Object>>.from([
        {'texto': '🔴 Vermelho', 'pontuacao': 10},
        {'texto': '🔵 Azul', 'pontuacao': 5},
        {'texto': '🟢 Verde', 'pontuacao': 3},
        {'texto': '🟡 Amarelo', 'pontuacao': 1},
      ])
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': List<Map<String, Object>>.from([
        {'texto': '🐇 Coelho', 'pontuacao': 10},
        {'texto': '🐍 Cobra', 'pontuacao': 5},
        {'texto': '🐘 Elefante', 'pontuacao': 3},
        {'texto': '🦁 Leão', 'pontuacao': 1},
      ])
    },
    {
      'texto': 'Qual é o seu veiculo favorito?',
      'respostas': List<Map<String, Object>>.from([
        {'texto': '🚗 Carro', 'pontuacao': 10},
        {'texto': '🚲 Bicicleta', 'pontuacao': 5},
        {'texto': '✈️ Avião', 'pontuacao': 3},
        {'texto': '🚢 Navio', 'pontuacao': 1},
      ])
    }
  ];

  // Método para responder a pergunta
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      // setState: Método que atualiza o estado do widget
      // O método build é chamado novamente
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  // Método para verificar se ainda existem perguntas a serem respondidas
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  // O método build recebe um contexto e retorna um widget
  // Contexto: Informações sobre a árvore de widgets
  // Widget: Componente visual
  Widget build(BuildContext context) {
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
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
              ),
      ),
    );
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
