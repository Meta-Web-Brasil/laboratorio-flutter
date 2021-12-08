import 'package:aula_01/models/signo.dart';
import 'package:aula_01/pages/signo_detalhe_page.dart';
import 'package:aula_01/repositories/signos_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final listaTodosSignos = SignosRepository.listarTodos;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Signo> signosSelecionados = [];

  double circularRadius = 12;
  double fontSizePage = 17;

  appBarDinamica() {
    if (signosSelecionados.isEmpty) {
      return AppBar(
        title: const Text('Signos'),
      );
    } else {
      return AppBar(
        leading: IconButton(
          onPressed: () => {
            setState(() {
              signosSelecionados = [];
            })
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Signos ${signosSelecionados.length}'),
        backgroundColor: Colors.blueGrey,
        elevation: 20,
        iconTheme: IconThemeData(
          color: Colors.amber[400],
        ),
        titleTextStyle: TextStyle(
            color: Colors.amber[400],
            fontWeight: FontWeight.bold,
            fontSize: 26),
      );
    }
  }

  mosrarDetalhesSigno(Signo signo) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SignoDetalhePage(signo: signo),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(circularRadius)),
              ),
              // leading: Image.asset(listaTodosSignos[index].icone, ),
              leading: (signosSelecionados.contains(listaTodosSignos[index]))
                  ? const CircleAvatar(
                      child: Icon(Icons.check),
                    )
                  : SizedBox(
                      child: SvgPicture.asset(
                        listaTodosSignos[index].icone,
                        // color: Colors.red,
                        height: 35,
                        width: 35,
                        semanticsLabel: listaTodosSignos[index].nome,
                      ),
                      width: 40,
                    ),
              title: Text(
                listaTodosSignos[index].nome,
                style: TextStyle(
                    fontSize: fontSizePage, fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                listaTodosSignos[index].elemento,
              ),
              selected: signosSelecionados.contains(listaTodosSignos[index]),
              selectedTileColor: Colors.indigo[50],
              onLongPress: () {
                setState(() {
                  (signosSelecionados.contains(listaTodosSignos[index]))
                      ? signosSelecionados.remove(listaTodosSignos[index])
                      : signosSelecionados.add(listaTodosSignos[index]);
                });
              },
              onTap: () => {
                mosrarDetalhesSigno(listaTodosSignos[index]),
              },
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, __) => Divider(),
          itemCount: listaTodosSignos.length),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: signosSelecionados.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () => {setState(() {})},
              label: Icon(
                Icons.star_outlined,
                color: Colors.amber[400],
                semanticLabel: 'Primeiro acessibilidade manual',
                size: 30,
              ),
            )
          : null,
    );
  }
}
