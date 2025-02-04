import 'dart:convert';

import 'package:conciertos2/src/models/grupos_model.dart';
import 'package:conciertos2/src/providers/grupos_provider.dart';
import 'package:conciertos2/src/widget/cards.dart';
import 'package:conciertos2/src/models/grupos_model.dart';
import 'package:flutter/material.dart';

class DiaTresPage extends StatefulWidget {
  const DiaTresPage({super.key});

  @override
  State<DiaTresPage> createState() => _DiaTresPageState();
}

class _DiaTresPageState extends State<DiaTresPage> {
  final ScrollController _scrollControllerNorte = ScrollController();
  final ScrollController _scrollControllerSur = ScrollController();
  final ScrollController _scrollControllerMontana = ScrollController();
  final ScrollController _scrollControllerBoomerang = ScrollController();
  final ScrollController _scrollControllerCasita = ScrollController();
  final ScrollController _scrollControllerParaguay = ScrollController();

  List<dynamic> _todosGrupos = [];
  List<dynamic> _gruposEncontrados = [];
  final gruposProvider = new ProviderGrupos();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: AssetImage("aa/background_dia1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          //_imagenDiaTres(),
          _imagenFechaTres(),
          // Expanded(
          //   child: _listarGruposDiaTres(),
          // ),
        ],
      ),
    );
  }

  Widget _imagenFechaTres() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/btnDia3.png'),
        image: AssetImage('aa/btnDia3.png'),
        fadeInDuration: Duration(seconds: 3),
        //width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenDiaTres() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/btnDia3.png'),
        image: AssetImage('aa/btnDia3.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _listarGruposDiaTres() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaTres(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: CircularProgressIndicator())],
          );
        }
        final grupo = Grupos.fromJsonList(snapshot.data);
        print("La lista de grupos del dia 1 es: ");

        final _todosGruposDiaTres = grupo.items;
        print(_todosGruposDiaTres);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollControllerNorte,
                thickness: 5,
                child: ListView.builder(
                    controller: _scrollControllerNorte,
                    shrinkWrap: true,
                    itemCount: _todosGruposDiaTres.length,
                    itemBuilder: (context, index) {
                      final grupo = _todosGruposDiaTres[index];
                      //Grupo grupo1 =

                      return _listItems(grupo);
                    }),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _imagenNorte() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscNorte.png'),
        image: AssetImage('aa/EscNorte.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.8,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenSur() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscSur.png'),
        image: AssetImage('aa/EscSur.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.8,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenMontana() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscMontana.png'),
        image: AssetImage('aa/EscMontana.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.9,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenBoomerang() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscBoomerang.png'),
        image: AssetImage('aa/EscBoomerang.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.8,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenLaCasita() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscCasita.png'),
        image: AssetImage('aa/EscCasita.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.9,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenParaguay() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/Esc_Paraguay.png'),
        image: AssetImage('aa/Esc_Paraguay.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.9,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buscarGrupos() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
              onChanged: (text) {
                _filtrar(text);
              },
              decoration: const InputDecoration(
                labelText: 'Buscar Zonas',
                suffixIcon: Icon(Icons.search),
              )),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: _gruposEncontrados.length,
              itemBuilder: (context, index) {
                Grupo grupo = _gruposEncontrados[index];

                return _listItems(grupo);
              }),
        ),
      ],
    );
  }

  Widget _listItems(Grupo infogrupo) {
    //final List<Widget> optValueWidget = [];

    // for (Grupo opt in infogrupo)
    // {
    //   //print(opt.domicilio);
    //   List<dynamic> grupo = [opt.estadio, opt.banda, opt.fecha];
    //   final witgetvalue =  Padding(
    //     padding: const EdgeInsets.only(top:10.0, bottom:10.0),
    //     child: CardGrupo(grupos: grupo),
    //   );
    //   optValueWidget.add(witgetvalue);
    // }
    // return optValueWidget;

    List<dynamic> grupo = [infogrupo.estadio, infogrupo.banda, infogrupo.fecha];
    final witgetvalue = Padding(
      padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
      child: CardGrupo(grupos: grupo),
    );

    return witgetvalue;
  }

  void _filtrar(String grupoBuscado) {
    final resultado = _todosGrupos.where((grupo) {
      final grupoNombre = grupo.banda.toString().toLowerCase();
      final input = grupoBuscado.toLowerCase();

      return grupoNombre.contains(input);
    }).toList();

    setState(() => _gruposEncontrados = resultado);
  }
}
