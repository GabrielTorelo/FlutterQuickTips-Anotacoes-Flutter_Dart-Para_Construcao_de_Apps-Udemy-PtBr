import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() funcao;

  const Resultado({super.key, required this.pontuacao, required this.funcao});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns! Sua pontuação foi $pontuacao pontos!';
    } else if (pontuacao < 12) {
      return 'Você é bom! Sua pontuação foi $pontuacao pontos!';
    } else if (pontuacao < 16) {
      return 'Impressionante! Sua pontuação foi $pontuacao pontos!';
    } else {
      return 'Nível Jedi! Sua pontuação foi $pontuacao pontos!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: Alinhamento principal
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            // width: Largura do widget
            width: MediaQuery.of(context).size.width - 50,
            child: Text(
              fraseResultado,
              textAlign: TextAlign.center,
              // style: Estilo do texto
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            // style: Estilo do botão
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            // onPressed: Evento que será executado ao clicar no botão
            onPressed: funcao,
            // child: Texto do botão
            child: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}
