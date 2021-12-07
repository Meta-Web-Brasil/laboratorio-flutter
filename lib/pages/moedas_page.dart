import 'package:aula_01/models/signo.dart';
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
  @override
  Widget build(BuildContext context) {
    final listaTodosSignos = SignosRepository.listarTodos;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    List<Signo> signosSelecionados = [];
    double circularRadius = 12;
    String appBarTitlePage = 'Signos';
    double fontSizePage = 17;

    return Scaffold(
      appBar: AppBar(title: Text(appBarTitlePage)),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(circularRadius)),
              ),
              // leading: Image.asset(listaTodosSignos[index].icone, ),
              leading: (signosSelecionados.contains(listaTodosSignos[index]))
                  ? CircleAvatar(
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

                print(listaTodosSignos[index].nome);
              },
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, __) => Divider(),
          itemCount: listaTodosSignos.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
