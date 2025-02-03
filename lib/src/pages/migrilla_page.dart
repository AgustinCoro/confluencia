import 'dart:async';

import 'package:conciertos2/src/models/grupoPersonalizado_model.dart';
import 'package:conciertos2/src/models/grupos_model.dart';
import 'package:conciertos2/src/pages/dia1_page.dart';
import 'package:conciertos2/src/pages/dia2_page.dart';
import 'package:conciertos2/src/pages/imagenes_page.dart';
import 'package:conciertos2/src/providers/grupos_provider.dart';
import 'package:conciertos2/src/widget/cardPersonalizada.dart';
import 'package:conciertos2/src/widget/cards.dart';
import 'package:conciertos2/src/widget/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiGrillaPage extends StatelessWidget {
  //const MiGrillaPage({super.key});

  final ScrollController _scrollControllerDiaUno = ScrollController();

  final ScrollController _scrollControllerDiaDos = ScrollController();

  final ScrollController _scrollControllerDiaTres = ScrollController();

  final ScrollController _scrollControllerDiaCuatro = ScrollController();

  List<GrupoPersonalizado> _todosGruposDiaUno = []; //
  List<GrupoPersonalizado> _todosGruposDiaDos = []; //
  List<GrupoPersonalizado> _todosGruposDiaTres = [];
  List<GrupoPersonalizado> _todosGruposDiaCuatro = [];

  int contador = 0;

  late Timer _timer;

  @override

  // void initState() {
  //   final _passwordVisible = false;

  //   super.initState();

  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       //contador = contador + 180;
  //       _listarGruposDiaUno();
  //       _listarGruposDiaDos();
  //     });
  //   });
  // }

  final gruposProvider = new ProviderGrupos();

  @override
  Widget build(BuildContext context) {
    //Color color = Color(842883);
    double screenWidth = MediaQuery.of(context).size.width;
    final currentIndex = Provider.of<ProviderGrupos>(context, listen: true);
    return Scaffold(
      backgroundColor: Color.fromRGBO(132, 40, 40, 1),
      body: //_todosGrupos.isEmpty ? _listarGrupos() : _buscarGrupos(),
          Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("aa/background_dia1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _imagenMiGrilla(screenWidth),

              _imagenFechaUno(screenWidth),

              //Text("El valor del index es ${currentIndex.indexMenu}", style: TextStyle(color: Colors.white), ),

              //_todosGruposDiaUno.isEmpty? Text("Aun no ha ingresado ningun artista", style: TextStyle(color: Colors.white), ) : _listarGruposDiaUno(),

              _listarGruposDiaUno(),

              _imagenFechaDos(screenWidth),

              // _todosGruposDiaDos.isEmpty? Padding(
              //   padding: const EdgeInsets.only(left: 80, right: 90, bottom: 500),
              //   child: Text("Aun no ha ingresado ningun artista", style: TextStyle(color: Colors.white), ),
              // ) : _listarGruposDiaDos(),

              _listarGruposDiaDos(),

              _imagenFechaTres(screenWidth),

              _listarGruposDiaTres(),

              _imagenFechaCuatro(screenWidth),

              _listarGruposDiaCuatro(),

              _politicaPrivacidad(context),
            ],
          ),
        ),
      ),
      //   bottomNavigationBar: BottomNavigationBar(
      //   //onTap: (index)=> currentIndex = index,
      //   //currentIndex: 0,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'INICIO',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.date_range),
      //       label: 'DIA 1',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.date_range),
      //       label: 'DIA 2',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list),
      //       label: 'MI GRILLA',
      //     ),
      //   ],
      //   currentIndex: currentIndex,

      //   selectedItemColor: Colors.orange,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   onTap: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      // ),
    );
  }

  Widget _imagenMiGrilla(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/Btn_MiGrilla.png'),
        image: AssetImage('aa/Btn_MiGrilla.png'),
        fadeInDuration: Duration(seconds: 3),
        width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenFechaUno(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/Btn_Dia1.png'),
        image: AssetImage('aa/Btn_Dia1.png'),
        fadeInDuration: Duration(seconds: 3),
        width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenFechaDos(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/Btn_Dia2.png'),
        image: AssetImage('aa/Btn_Dia2.png'),
        fadeInDuration: Duration(seconds: 3),
        width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenFechaTres(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/Btn_Dia3.png'),
        image: AssetImage('aa/Btn_Dia3.png'),
        fadeInDuration: Duration(seconds: 3),
        width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenFechaCuatro(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/Btn_Dia4.png'),
        image: AssetImage('aa/Btn_Dia4.png'),
        fadeInDuration: Duration(seconds: 3),
        width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _listarGruposDiaUno() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaUnoGrillaPersonal(),
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

        final grupo = GruposPersonalizados.fromJsonList(snapshot.data);

        _todosGruposDiaUno = grupo.items;

        if (_todosGruposDiaUno.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(left: 80, right: 90, bottom: 100),
            child: Text(
              "Aun no ha ingresado ningun artista",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: 300,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollControllerDiaUno,
                  thickness: 5,
                  child: ListView.builder(
                      controller: _scrollControllerDiaUno,
                      shrinkWrap: true,
                      itemCount: _todosGruposDiaUno.length,
                      itemBuilder: (context, index) {
                        final grupo = _todosGruposDiaUno[index];
                        //Grupo grupo1 =

                        return _listItems(grupo);
                      }),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _listarGruposDiaDos() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaDosGrillaPersonal(),
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

        final grupo = GruposPersonalizados.fromJsonList(snapshot.data);

        _todosGruposDiaDos = grupo.items;

        if (_todosGruposDiaDos.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(left: 80, right: 90, bottom: 100),
            child: Text(
              "Aun no ha ingresado ningun artista",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: 400,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollControllerDiaDos,
                  thickness: 5,
                  child: ListView.builder(
                      controller: _scrollControllerDiaDos,
                      shrinkWrap: true,
                      itemCount: _todosGruposDiaDos.length,
                      itemBuilder: (context, index) {
                        final grupo = _todosGruposDiaDos[index];
                        //Grupo grupo1 =

                        return _listItems(grupo);
                      }),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _listarGruposDiaTres() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaTresGrillaPersonal(),
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

        final grupo = GruposPersonalizados.fromJsonList(snapshot.data);

        _todosGruposDiaTres = grupo.items;

        if (_todosGruposDiaTres.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(left: 80, right: 90, bottom: 100),
            child: Text(
              "Aun no ha ingresado ningun artista",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: 400,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollControllerDiaTres,
                  thickness: 5,
                  child: ListView.builder(
                      controller: _scrollControllerDiaTres,
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
        }
      },
    );
  }

  Widget _listarGruposDiaCuatro() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaCuatroGrillaPersonal(),
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

        final grupo = GruposPersonalizados.fromJsonList(snapshot.data);

        _todosGruposDiaCuatro = grupo.items;

        if (_todosGruposDiaCuatro.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(left: 80, right: 90, bottom: 100),
            child: Text(
              "Aun no ha ingresado ningun artista",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: 400,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollControllerDiaCuatro,
                  thickness: 5,
                  child: ListView.builder(
                      controller: _scrollControllerDiaCuatro,
                      shrinkWrap: true,
                      itemCount: _todosGruposDiaCuatro.length,
                      itemBuilder: (context, index) {
                        final grupo = _todosGruposDiaCuatro[index];
                        //Grupo grupo1 =

                        return _listItems(grupo);
                      }),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  _politicaPrivacidad(context) {
    String mensaje =
        "With your agreement, we and our partners use device storage to store and access personal data such as precise geolocation data and identification through device scanning. We process this data for purposes such as personalised ads and content, ad and content measurement, audience insights and product development. You may withdraw your consent or object to data processing based on legitimate interest at any time from the app menu.";

    return GestureDetector(
      child: Text(
        "Politica de Privacidad",
        style: TextStyle(color: Colors.lightBlue, fontSize: 20),
      ),
      onTap: () {
        ShowDialogPage.politicaPrivacidad(
            context, "Politica Privacidad", mensaje, 1);
      },
    );
  }

  Widget _listItems(GrupoPersonalizado infogrupo) {
    List<dynamic> grupo = [
      infogrupo.estadio,
      infogrupo.banda,
      infogrupo.fecha,
      infogrupo.id
    ];
    final witgetvalue = Padding(
      padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
      child: CardGrupoPersonalizado(gruposPersonalizados: grupo),
    );
    return witgetvalue;
  }
}
