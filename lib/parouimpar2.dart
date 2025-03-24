import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ParImpar2());
}

class ParImpar2 extends StatefulWidget {
  const ParImpar2({super.key});

  @override
  State<ParImpar2> createState() => _ParImparState();
}

class _ParImparState extends State<ParImpar2> {
  String _opcaoApp = 'Escolha Par ou Ímpar';
  String _mensagem = '';
  bool? _escolhaUsuario; // true para Par, false para Ímpar
  bool _jogoIniciado = false;
  bool _jogoTerminado = false; // controlar o estado do jogo
  int? _numeroEscolhidoUsuario; // Guardar o número escolhido pelo usuário

  void _escolherParImpar(bool escolha) {
    setState(() {
      _escolhaUsuario = escolha;
      _opcaoApp = escolha ? 'Você escolheu Par. O App escolheu Ímpar.' : 'Você escolheu Ímpar. O App escolheu Par.';
      _jogoIniciado = true;
      _jogoTerminado = false; // Reinicia o estado do jogo
      _mensagem = '';
      _numeroEscolhidoUsuario = null; // Reseta o número do usuário
    });
  }

  void _opcaoSelecionada(int escolhaUsuario) {
    if (!_jogoIniciado || _escolhaUsuario == null) return;

    final opcoes = List.generate(11, (index) => index);
    var numero = Random().nextInt(11);
    var escolhaApp = opcoes[numero];

    setState(() {
      _numeroEscolhidoUsuario = escolhaUsuario; 
      var soma = escolhaApp + escolhaUsuario;
      _opcaoApp = 'Número do App: $escolhaApp\nOpção do App: ${_escolhaUsuario! ? "Ímpar" : "Par"}';

      if (_escolhaUsuario! && soma % 2 == 0) {
        _mensagem = 'Parabéns!!! Você ganhou :)';
      } else if (!_escolhaUsuario! && soma % 2 != 0) {
        _mensagem = 'Parabéns!!! Você ganhou :)';
      } else {
        _mensagem = 'Você perdeu :(';
      }
      _jogoTerminado = true; // O jogo terminou após a seleção
    });
  }

  void _jogarNovamente() {
    setState(() {
      _opcaoApp = 'Escolha Par ou Ímpar';
      _mensagem = '';
      _jogoIniciado = false;
      _jogoTerminado = false; // Reinicia o estado do jogo
      _escolhaUsuario = null; // Reseta a escolha do usuário
      _numeroEscolhidoUsuario = null; // Reseta o número escolhido
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
                fontWeight: FontWeight.bold,
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
          if (!_jogoIniciado) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _escolherParImpar(true),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    backgroundColor: Color.fromARGB(255, 141, 81, 59),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Par',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _escolherParImpar(false),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    backgroundColor: Color.fromARGB(255, 141, 81, 59),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Ímpar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ] else if (!_jogoTerminado) ...[
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
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
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
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
                        color: const Color.fromARGB(255, 46, 46, 46),
                      ),
                    ),
                  );
                },
              ),
            ),
          ] else ...[
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Você escolheu o número: $_numeroEscolhidoUsuario\n E a sua opção: ${_escolhaUsuario! ? "Par" : "Ímpar"}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _jogarNovamente,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  backgroundColor: Color.fromARGB(255, 141, 81, 59),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text('Jogar Novamente',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
