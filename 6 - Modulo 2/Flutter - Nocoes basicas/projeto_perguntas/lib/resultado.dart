import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  const Resultado({super.key, required this.pontuacao});

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
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 50,
        child: Text(
          fraseResultado,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
