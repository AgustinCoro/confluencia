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

class MiGrillaPage2 extends StatelessWidget {
  //const MiGrillaPage2({super.key});

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
              _imagenFechaUno(screenWidth),
              _imagenFechaDos(screenWidth),
              _imagenFechaTres(screenWidth),
              _imagenFechaCuatro(screenWidth),
              _politicaPrivacidad(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imagenMiGrilla(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/Btn_MiGrilla.png'),
        image: AssetImage('aa/Btn_MiGrilla.png'),
        fadeInDuration: Duration(seconds: 3),
        //width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenFechaUno(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/btnDia1.png'),
        image: AssetImage('aa/btnDia1.png'),
        fadeInDuration: Duration(seconds: 3),
        //width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenFechaDos(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/btnDia2.png'),
        image: AssetImage('aa/btnDia2.png'),
        fadeInDuration: Duration(seconds: 3),
        //width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenFechaTres(screenWidth) {
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

  Widget _imagenFechaCuatro(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/btnDia4.png'),
        image: AssetImage('aa/btnDia4.png'),
        fadeInDuration: Duration(seconds: 3),
        //width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
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
