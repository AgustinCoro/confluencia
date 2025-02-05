import 'package:conciertos2/src/pages/dia1_page.dart';
import 'package:conciertos2/src/pages/dia2_page.dart';
import 'package:conciertos2/src/pages/dia3_page.dart';
import 'package:conciertos2/src/pages/dia4_page.dart';
import 'package:conciertos2/src/pages/elementos_page.dart';
import 'package:conciertos2/src/pages/imagenes_page.dart';
import 'package:conciertos2/src/pages/intro_page.dart';
import 'package:conciertos2/src/pages/mapa_page.dart';
import 'package:conciertos2/src/pages/migrilla_page.dart';
import 'package:conciertos2/src/pages/migrilla_page2.dart';
import 'package:conciertos2/src/providers/grupos_provider.dart';
import 'package:conciertos2/src/services/notification_services.dart';
import 'package:conciertos2/src/widget/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Sidebarmenu2 extends StatefulWidget {
  const Sidebarmenu2({super.key});

  @override
  State<Sidebarmenu2> createState() => _Sidebarmenu2State();
}

class _Sidebarmenu2State extends State<Sidebarmenu2> {
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

  @override
  Widget build(BuildContext context) {
    startTimer();
    mostrarMensajes();

    final currentIndex = Provider.of<ProviderGrupos>(context, listen: true);
    return Scaffold(
      // appBar: AppBar(
      //   // Se elimina el título
      //    // Para mostrar el ícono de 3 rayas
      //   //backgroundColor: Colors.blue,
      //   elevation: 0, // Quita la sombra del AppBar
      // ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Center(
            child: Image(
          image: AssetImage('aa/iconoapp.png'),
          width: 70.0,
        )),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black, // Puedes cambiar el color de fondo
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40, // Ajusta el tamaño de la imagen
                    backgroundImage: AssetImage(
                        'aa/iconoapp.png'), // Ruta de tu imagen en assets
                  ),
                  // SizedBox(height: 10),
                  // Text(
                  //   "Nombre del Usuario",
                  //   style: TextStyle(color: Colors.white, fontSize: 18),
                  // ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Inicio",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Sidebarmenu2()));
                ; // Cierra el drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              title: Text(
                "Grilla",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MiGrillaPage()));
                ; // Cierra el drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              title: Text(
                "DIA 1",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DiaUnoPage()));
                ; // Cierra el drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              title: Text(
                "DIA 2",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DiaDosPage()));
                ; // Cierra el drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              title: Text(
                "DIA 3",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DiaTresPage()));
                ; // Cierra el drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              title: Text(
                "DIA 4",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DiaCuatroPage()));
                ; // Cierra el drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              title: Text(
                "Elementos SI / NO",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ElementosPage()));
                ; // Cierra el drawer
              },
            ),
          ],
        ),
      ),
      body: ImagenesPage(),
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
