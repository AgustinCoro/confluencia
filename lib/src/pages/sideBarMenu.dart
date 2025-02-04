import 'package:conciertos2/src/pages/dia1_page.dart';
import 'package:conciertos2/src/pages/dia2_page.dart';
import 'package:conciertos2/src/pages/dia3_page.dart';
import 'package:conciertos2/src/pages/dia4_page.dart';
import 'package:conciertos2/src/pages/elementos_page.dart';
import 'package:conciertos2/src/pages/imagenes_page.dart';
import 'package:conciertos2/src/providers/grupos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBarMenu extends StatelessWidget {
  final gruposProvider = new ProviderGrupos();

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<ProviderGrupos>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        // Se elimina el título
        automaticallyImplyLeading: true, // Para mostrar el ícono de 3 rayas
        //backgroundColor: Colors.blue,
        elevation: 0, // Quita la sombra del AppBar
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader(
            //   // decoration: BoxDecoration(
            //   //   color: Colors.blue,
            //   // ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       CircleAvatar(
            //         radius: 30,
            //         backgroundColor: Colors.white,
            //         child: Icon(Icons.person, size: 40, color: Colors.blue),
            //       ),
            //       SizedBox(height: 10),
            //       Text(
            //         "Usuario",
            //         style: TextStyle(color: Colors.white, fontSize: 18),
            //       ),
            //       Text(
            //         "usuario@email.com",
            //         style: TextStyle(color: Colors.white70, fontSize: 14),
            //       ),
            //     ],
            //   ),
            // ),
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
                    MaterialPageRoute(builder: (context) => ImagenesPage()));
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
                "Elementos",
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
}
