import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reininciarQuestionario;
  Resultado(this.pontuacao, this.reininciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return ' Parabens';
    } else if (pontuacao < 12) {
      return 'Vc é bom ';
    } else if (pontuacao < 16) {
      return ' Top';
    } else {
      return 'Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 60),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue, primary: Colors.black),
          onPressed: reininciarQuestionario,
          child: Text("Voltar o Jogo "),
        )
      ],
    );
  }
}
