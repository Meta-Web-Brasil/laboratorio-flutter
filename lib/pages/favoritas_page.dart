import 'package:aula_01/repositories/favoritas_repository.dart';
import 'package:aula_01/widget/signo_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritasPage extends StatefulWidget {
  FavoritasPage({Key? key}) : super(key: key);

  @override
  _FavoritasPageState createState() => _FavoritasPageState();
}

class _FavoritasPageState extends State<FavoritasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signos favoritos'),
      ),
      body: Container(
        color: Colors.indigo.withOpacity(0.05),
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12),
        child: Consumer<FavoritasRepository>(
          builder: (context, favoritas, child) {
            return favoritas.lista.isEmpty
                ? const ListTile(
                    leading: Icon(Icons.star),
                    title: Text("Ainda não há signos favoritos"),
                  )
                : ListView.builder(
                    itemCount: favoritas.lista.length,
                    itemBuilder: (signo, index) {
                      return SignoCard(signo: favoritas.lista[index]);
                    },
                  );
          },
        ),
      ),
    );
  }
}
