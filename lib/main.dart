import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'contatos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laura',
      home: Formulario(),
    );
  }
}

class Formulario extends StatelessWidget {
  final List<Contato> contatos = [];
  final TextEditingController controladorNome = TextEditingController();
  final TextEditingController controladorNumero = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: controladorNome,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nome',
                      hintText: 'Fulano',
                    ),
                  ),
                  TextField(
                    controller: controladorNumero,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Número',
                      hintText: '(xx)x xxxx-xxxx',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            child: ElevatedButton(
              onPressed: () {
                Contato contato = new Contato(
                    nome: controladorNome.text, numero: controladorNumero.text);
                contatos.add(contato);
                for (Contato cont in contatos) {
                  print('Nome: ' + cont.nome + ' - Numero:' + cont.numero);
                }
              },
              child: Text('SALVAR'),
            ),
          )
        ],
      ),
    );
  }
}
