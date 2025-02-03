import 'package:conciertos2/src/pages/dia1_page.dart';
import 'package:conciertos2/src/pages/dia2_page.dart';
import 'package:conciertos2/src/pages/dia3_page.dart';
import 'package:conciertos2/src/pages/dia4_page.dart';
import 'package:conciertos2/src/pages/imagenes_page.dart';
import 'package:conciertos2/src/pages/intro_page.dart';
import 'package:conciertos2/src/pages/mapa_page.dart';
import 'package:conciertos2/src/pages/migrilla_page.dart';
import 'package:conciertos2/src/providers/grupos_provider.dart';
import 'package:conciertos2/src/services/notification_services.dart';
import 'package:conciertos2/src/widget/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  late Timer timer;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    print("INicio la aplicacion");
    _checkFirstLaunch();
    cargando();
  }

  void cargando() {
    timer = Timer(Duration(seconds: 8), () {
      setState(() {
        loading = false;
      });
    });
  }

  /// Verifica si es la primera vez que se ejecuta la aplicación
  Future<void> _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    print("Check primer lanzamiento");
    if (isFirstLaunch) {
      print("Primer lanzamiento correcto");
      Future.delayed(Duration.zero, () {
        ShowDialogPage.politicaPrivacidad(
          context,
          "Política de Privacidad",
          "With your agreement, we and our partners use device storage to store and access personal data such as precise geolocation data and identification through device scanning. We process this data for purposes such as personalised ads and content, ad and content measurement, audience insights and product development. You may withdraw your consent or object to data processing based on legitimate interest at any time from the app menu.",
          1,
        );
      });

      // Actualizar el estado para que no sea la primera vez
      await prefs.setBool('isFirstLaunch', false);
    }
  }

  /// Muestra un diálogo de bienvenida
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

  int _selectedIndex = 0;

  final screens = [
    ImagenesPage(),
    DiaUnoPage(),
    DiaDosPage(),
    DiaTresPage(),
    DiaCuatroPage(),
    MiGrillaPage(),
    MapaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    startTimer();
    mostrarMensajes();

    final currentIndex = Provider.of<ProviderGrupos>(context, listen: true);

    return loading
        ? IntroPage()
        : Scaffold(
            appBar: AppBar(
              //title: Text('Navegación'),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80.0), // Altura personalizada
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.home),
                          onPressed: () {
                            setState(() {
                              currentIndex.indexMenu = 0;
                            });
                          },
                        ),
                        Text('INICIO', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            setState(() {
                              currentIndex.indexMenu = 1;
                            });
                          },
                        ),
                        Text('DIA 1', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            setState(() {
                              currentIndex.indexMenu = 2;
                            });
                          },
                        ),
                        Text('DIA 2', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            setState(() {
                              currentIndex.indexMenu = 3;
                            });
                          },
                        ),
                        Text('DIA 3', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            setState(() {
                              currentIndex.indexMenu = 4;
                            });
                          },
                        ),
                        Text('DIA 4', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.list),
                          onPressed: () {
                            setState(() {
                              currentIndex.indexMenu = 5;
                            });
                          },
                        ),
                        Text('MAPA', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: screens[currentIndex.indexMenu],
          );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 60), (timer) {
      DateTime now = DateTime.now();
      obtenerRegistrosConDiferenciaDeTiempo();
    });
  }

  void mostrarMensajes() {
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      DateTime now = DateTime.now();
      obtenerAvisos();
    });
  }
}
