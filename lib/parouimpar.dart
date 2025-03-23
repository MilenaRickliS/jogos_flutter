import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ParImpar());
}

class ParImpar extends StatefulWidget {
  const ParImpar({super.key});

  @override
  State<ParImpar> createState() => _ParImparState();
}

class _ParImparState extends State<ParImpar> {
  String _opcaoApp = 'Escolhendo um número ...';
  String _mensagem = '';
  

  void _opcaoSelecionada(int escolhaUsuario){
    final opcoes = List.generate(11, (index) => index);
    var numero = Random().nextInt(11);
    var escolhaApp = opcoes[numero];

    setState(() {
       _opcaoApp = 'Número do App: $escolhaApp';
      var soma = escolhaApp + escolhaUsuario;

      if (escolhaUsuario%2 == 0 && soma % 2 == 0 && escolhaApp%2 != 0) {
        _mensagem = 'Parabéns!!! Você ganhou :)';
      } else if (escolhaUsuario%2 != 0 && soma % 2 != 0 && escolhaApp%2 == 0) {
        _mensagem = 'Parabéns!!! Você ganhou :)';
      } else if (escolhaUsuario%2 == 0 && soma % 2 != 0 && escolhaApp%2 != 0) {
        _mensagem = 'Você perdeu :(';
      } else if (escolhaUsuario%2 != 0 && soma % 2 == 0 && escolhaApp%2 == 0) {
        _mensagem = 'Você perdeu :(';
      } else {
        _mensagem = 'Empatamos ;)';
      }
    });
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Par ou Ímpar',
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
              _opcaoApp,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
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
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text(
              'Escolha um número para jogar',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),            
              ),
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount: 11,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () => _opcaoSelecionada(index),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 179, 175, 175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                child: Text(
                  index.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}