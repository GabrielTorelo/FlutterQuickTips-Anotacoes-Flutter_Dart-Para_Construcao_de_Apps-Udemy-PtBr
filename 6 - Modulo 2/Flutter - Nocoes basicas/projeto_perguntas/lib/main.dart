import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());

// Para que a classe PerguntaApp seja reconhecida como um widget
// É necessário que ela herde de "StatelessWidget" ou "StatefulWidget"
//
// StatelessWidget: Widget que não possui estado
// StatefulWidget: Widget que possui estado
//
class PerguntaApp extends StatelessWidget {
  // O decorator @override é opcional
  // Ele indentifica que o método abaixo está sobrescrevendo um método da classe pai (StatelessWidget)
  @override
  // O método build recebe um contexto e retorna um widget
  // Contexto: Informações sobre a árvore de widgets
  // Widget: Componente visual
  Widget build(BuildContext context) {
    // MaterialApp: Widget que configura o tema da aplicação
    return MaterialApp(
      home: Text('Olá Flutter!!!'),
    );
  }
}
