import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final int opcao;
  final void Function(int) funcao;

  const Resposta(
      {super.key,
      required this.texto,
      required this.opcao,
      required this.funcao});

  @override
  Widget build(BuildContext context) {
    // ElevatedButton: Botão com elevação
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: ElevatedButton(
        // style: Estilo do botão
        style: ElevatedButton.styleFrom(
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.zero,
          // ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        // onPressed: Evento que será executado ao clicar no botão
        onPressed: () => funcao(opcao),
        // child: Texto do botão
        child: Text(texto),
      ),
    );
  }
}
