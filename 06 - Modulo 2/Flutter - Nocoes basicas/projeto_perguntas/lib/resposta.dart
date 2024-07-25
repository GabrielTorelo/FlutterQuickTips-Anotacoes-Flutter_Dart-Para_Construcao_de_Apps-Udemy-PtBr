import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() funcao;

  const Resposta({super.key, required this.texto, required this.funcao});

  @override
  Widget build(BuildContext context) {
    // ElevatedButton: Botão com elevação
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: ElevatedButton(
        // style: Estilo do botão
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        // onPressed: Evento que será executado ao clicar no botão
        onPressed: funcao,
        // child: Texto do botão
        child: Text(texto),
      ),
    );
  }
}
