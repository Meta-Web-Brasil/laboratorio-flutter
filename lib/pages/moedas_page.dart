import 'package:aula_01/repositories/signos_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoedasPage extends StatelessWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listaTodosSignos = SignosRepository.listarTodos;

    return Scaffold(
      appBar: AppBar(title: Text('Hello World!')),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              // leading: Image.asset(listaTodosSignos[index].icone, ),
              leading: SvgPicture.asset(
                listaTodosSignos[index].icone,
                // color: Colors.red,
                height: 35,
                width: 35,
                semanticsLabel: listaTodosSignos[index].nome,
              ),
              title: Text(listaTodosSignos[index].nome),
              trailing: Text(listaTodosSignos[index].elemento),
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (context, index) => Divider(),
          itemCount: listaTodosSignos.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
