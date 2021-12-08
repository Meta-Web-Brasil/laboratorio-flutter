import 'package:aula_01/models/signo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignoDetalhePage extends StatefulWidget {
  Signo signo;

  SignoDetalhePage({Key? key, required this.signo}) : super(key: key);

  @override
  _SignoDetalhePageState createState() => _SignoDetalhePageState();
}

class _SignoDetalhePageState extends State<SignoDetalhePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(widget.signo.icone,
            color: Colors.white,
            height: 50,
            width: 50,
            semanticsLabel: 'Signo de aquario'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(widget.signo.icone),
              const Divider(
                height: 40,
                thickness: 10,
                color: Colors.amber,
              ),
            ],
          )
        ],
      ),
    );
  }
}
