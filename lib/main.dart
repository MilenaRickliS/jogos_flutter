import 'package:flutter/material.dart';
import 'package:jogos_flutter/jokenpo.dart';
import 'package:jogos_flutter/parouimpar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 76, 102, 175),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Jogos(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Jogos extends StatelessWidget {
  const Jogos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha um jogo',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 72, 41, 30),
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: Colors.white),
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Escolha um jogo abaixo'),
                  duration: Duration(seconds: 2), // Duração do SnackBar
                  behavior: SnackBarBehavior.floating, // Comportamento do SnackBar
                  backgroundColor: Colors.black87, // Cor de fundo do SnackBar
                ),
              );
            },
            ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => Jokenpo(),
                    ),
                );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 167, 136, 0),
                padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),

              ),
              icon: Icon(Icons.gamepad, color: Colors.white),
              label: Text(
                'Joken Po',
                 style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => ParImpar(),
                    ),
                );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 34, 119, 0),
                padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: Icon(Icons.calculate, color: Colors.white),
              label: Text(
                'Par ou Ímpar',
                 style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}