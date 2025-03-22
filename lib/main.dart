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
        primaryColor: Colors.green,
        scaffoldBackgroundColor: const Color.fromARGB(255, 215, 255, 211),
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
        title: Text('Escolha um jogo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => Jokenpo(),
                    ),
                );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 72, 41, 30),
                padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Joken Po',
                 style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => ParImpar(),
                    ),
                );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 72, 41, 30),
                padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Par ou Ímpar',
                 style: TextStyle(
                    fontSize: 16,
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