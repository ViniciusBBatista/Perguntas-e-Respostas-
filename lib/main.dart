import 'package:flutter/material.dart';
import './Questionario.dart';
import 'resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      "texto": "Qual é sua time  favorita?",
      "resposta": [
        {"texto": "Corinthias", "pontuacao": 10},
        {"texto": "Palmeiras", "pontuacao": 5},
        {"texto": "São Paulo", "pontuacao": 3},
        {"texto": "Santos", "pontuacao": 1}
      ],
    },
    {
      "texto": "Qual é seu Video Game favorito?",
      "resposta": [
        {"texto": "Xbox", "pontuacao": 10},
        {"texto": "PlayStation", "pontuacao": 5},
        {"texto": "Nintendo", "pontuacao": 3},
        {"texto": "Sega", "pontuacao": 1},
      ],
    },
    {
      "texto": "Qual é seu Super Heroi Favorito?",
      "resposta": [
        {"texto": "Spider", "pontuacao": 10},
        {"texto": "Batman", "pontuacao": 5},
        {"texto": "Capitão", "pontuacao": 3},
        {"texto": "SuperMan", "pontuacao": 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reininciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Perguntas")),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                QuandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reininciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
