import 'package:aula_01/models/signo.dart';

class SignosRepository {
  static List<Signo> listarTodos = [
    Signo(
      icone: 'images/aries.svg',
      nome: 'Aries',
      casa: '01',
      elemento: 'Fogo',
      preco: 10.4,
    ),
    Signo(
      icone: 'images/touro.svg',
      nome: 'Touro',
      casa: '02',
      elemento: 'Terra',
      preco: 80.3,
    ),
    Signo(
      icone: 'images/gemeos.svg',
      nome: 'Gemeos',
      casa: '03',
      elemento: 'Ar',
      preco: 56.383,
    ),
    Signo(
      icone: 'images/cancer.svg',
      nome: 'Câncer',
      casa: '04',
      elemento: 'Água',
      preco: 00.83633,
    ),
    Signo(
      icone: 'images/leao.svg',
      nome: 'Leao',
      casa: '05',
      elemento: 'Fogo',
      preco: 02.029282,
    ),
    Signo(
      icone: 'images/virgem.svg',
      nome: 'Virgem',
      casa: '06',
      elemento: 'Terra',
      preco: 29.39,
    ),
    Signo(
      icone: 'images/libra.svg',
      nome: 'Libra',
      casa: '07',
      elemento: 'Ar',
      preco: 39.120,
    ),
    Signo(
      icone: 'images/escorpiao.svg',
      nome: 'Escorpião',
      casa: '08',
      elemento: 'Água',
      preco: 10.40,
    ),
    Signo(
      icone: 'images/sagitario.svg',
      nome: 'Sagitário',
      casa: '09',
      elemento: 'Fogo',
      preco: 22.44,
    ),
    Signo(
      icone: 'images/capricornio.svg',
      nome: 'Capricórnio',
      casa: '10',
      elemento: 'Terra',
      preco: 29.33,
    ),
    Signo(
      icone: 'images/aquario.svg',
      nome: 'Aquário',
      casa: '11',
      elemento: 'Ar',
      preco: 09.20,
    ),
    Signo(
      icone: 'images/peixes.svg',
      nome: 'Peixes',
      casa: '12',
      elemento: 'Água',
      preco: 20.20,
    )
  ];
}
