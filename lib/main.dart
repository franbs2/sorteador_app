import 'dart:math';
import 'package:flutter/material.dart';

//função main para rodar o app
void main() {
  runApp(const MyApp());
}

//classe MyApp que é um widget de estado imutável
class MyApp extends StatelessWidget {
  const MyApp({super.key});

//método build que retorna um MaterialApp
// oq é um MaterialApp? é um widget que implementa o layout de material design
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorteador de Números',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      //home é o widget que será exibido na tela
      home: const MyHomePage(title: 'Sorteador de números'),
    );
  }
}

//classe MyHomePage que é um widget de estado mutável
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  //cria o estado do widget
  State<MyHomePage> createState() => _MyHomePageState();
}

//classe _MyHomePageState que é um widget de estado mutável
class _MyHomePageState extends State<MyHomePage> {
  int _numeroSorteado = 0;
  //método que sortea um número aleatório
  void _sortearNumero() {
    //setState é um método que atualiza o estado do widget
    setState(() {
      _numeroSorteado = Random().nextInt(100);
    });
  }

  @override
  //método build que retorna um Scaffold
  //o que é o metodo build? é um método que constrói o widget
  Widget build(BuildContext context) {
    //Scaffold é um widget que implementa o layout de material design
    return Scaffold(
      //appBar é a barra superior do app
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(widget.title),
      ),
      //body é o corpo do app
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Número sorteado:',
              style: TextStyle(fontSize: 28),
            ),
            Text(
              '$_numeroSorteado',
              style: const TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: _sortearNumero,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              ),
              child: const Text(
                'Sortear número',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
