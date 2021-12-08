import 'package:aula_01/models/signo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SignoDetalhePage extends StatefulWidget {
  Signo signo;

  SignoDetalhePage({Key? key, required this.signo}) : super(key: key);

  @override
  _SignoDetalhePageState createState() => _SignoDetalhePageState();
}

class _SignoDetalhePageState extends State<SignoDetalhePage> {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  double quantidade = 0;

  Color temaSigno(Signo signo) {
    Color cor;

    if (signo.elemento == 'Fogo') {
      cor = Colors.orange;
    } else if (signo.elemento == 'Água') {
      cor = Colors.blue;
    } else if (signo.elemento == 'Terra') {
      cor = Colors.brown;
    } else if (signo.elemento == 'Ar') {
      cor = Colors.green;
    } else {
      cor = Colors.black;
    }

    return cor;
  }

  comprar() {
    if (_form.currentState!.validate()) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Compra realizada com sucesso'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(widget.signo.icone,
            color: Colors.white,
            height: 50,
            width: 50,
            semanticsLabel: 'Signo de aquario'),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [Text(widget.signo.elemento)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /* SizedBox(
                    child: SvgPicture.asset(widget.signo.icone),
                    height: 90,
                    width: 90,
                  ), */
                  Text(
                    widget.signo.nome,
                    style: const TextStyle(color: Colors.black, fontSize: 40),
                    // textScaleFactor: 4,
                  )
                ],
              ),
            ),
            (quantidade > 0)
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      child: Text(
                        widget.signo.elemento,
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 24),
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(.1),
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(bottom: 24),
                  ),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor',
                  prefixIcon: Icon(
                    Icons.monetization_on_outlined,
                  ),
                  suffix: Text(
                    'Reais',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o valor da compra';
                  } else if (double.parse(value) < 50) {
                    return 'Compra minima é de R\$50,00';
                  }

                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    quantidade =
                        (value.isEmpty) ? 0 : double.parse(value) / 100;
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 24),
              child: ElevatedButton(
                onPressed: () {
                  comprar();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.check),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        "Horóscopo",
                        style: TextStyle(color: Colors.amber, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
