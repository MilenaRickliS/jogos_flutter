import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const Jokenpo());
}

class Jokenpo extends StatefulWidget {
  const Jokenpo({super.key});

  @override
  State<Jokenpo> createState() => _JogoState();
}

class _JogoState extends State<Jokenpo> {
  var _imagemApp = AssetImage('imagem/padrao.png');
  var _mensagem = 'Escolha sua opção abaixo';

  final Map<String, AssetImage> _opcaoImagem = {
    'pedra': AssetImage('imagem/pedra.png'),
    'papel': AssetImage('imagem/papel.png'),
    'tesoura': AssetImage('imagem/tesoura.png'),
  };

  void _opcaoSelecionada(String escolhaUsuario){
    final opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    setState(() {
      _imagemApp = _opcaoImagem[escolhaApp]!;

      if(
        (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')
      ){
        setState(() {
          _mensagem = 'Parabéns!!! Você ganhou :)';
        });
      }else if(
        (escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra')
      ){
        setState(() {
          _mensagem = 'Você perdeu :(';
        });
      } else{
        setState(() {
          _mensagem = 'Empatamos ;)';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JokenPo',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 141, 81, 59),
        elevation: 4,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _mensagem.contains('Parabéns') ? Colors.green : Colors.red,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset('imagem/pedra.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset('imagem/papel.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset('imagem/tesoura.png', height: 100,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}