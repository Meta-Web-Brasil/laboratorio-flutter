import 'package:aula_01/models/signo.dart';
import 'package:aula_01/pages/signo_detalhe_page.dart';
import 'package:aula_01/repositories/favoritas_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SignoCard extends StatefulWidget {
  Signo signo;

  SignoCard({Key? key, required this.signo}) : super(key: key);

  @override
  _SignoCardState createState() => _SignoCardState();
}

class _SignoCardState extends State<SignoCard> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  static Map<String, Color> elementoColor = <String, Color>{
    "fogo": Colors.orange,
    "agua": Colors.indigo,
    "terra": Colors.brown,
    "ar": Colors.green
  };

  abrirDetalhes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SignoDetalhePage(signo: widget.signo),
      ),
    );
  }

  void removeSignoFavorito() {
    Provider.of<FavoritasRepository>(context, listen: false)
        .remover(widget.signo);
    Navigator.pop(context);
  }

  mwbContainerBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: elementoColor[widget.signo.raw[0]]!.withOpacity(0.05),
        border: Border.all(
            color: elementoColor[widget.signo.raw[0]]!.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        widget.signo.elemento,
        style: TextStyle(color: elementoColor[widget.signo.raw[0]]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
        onTap: () => abrirDetalhes(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              SvgPicture.asset(
                widget.signo.icone,
                height: 40,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.signo.nome,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Casa ${widget.signo.casa}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black45,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              mwbContainerBadge(),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text('Remover dos favoritos'),
                      // onTap: () => removeSignoFavorito(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
