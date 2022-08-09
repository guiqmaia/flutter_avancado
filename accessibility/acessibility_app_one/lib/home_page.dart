import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accessibility'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://www.mensagensdebomdia.com.br/wp-content/uploads/2020/01/77B38E74-EE06-4EB2-8A63-9031E494337C.jpeg',
              semanticLabel: 'Foto de Bom Dia',
            ),
            IconButton(
              icon: const Icon(Icons.done_all),
              onPressed: () {},
              tooltip: 'Botão Salvar',
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {},
            ),
            Semantics(
              hint: 'Botão Não Salvar',
              child: InkWell(
                excludeFromSemantics: true,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Não Salvar'),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
