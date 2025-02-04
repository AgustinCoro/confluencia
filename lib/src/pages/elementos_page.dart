import 'package:flutter/material.dart';

class ElementosPage extends StatefulWidget {
  const ElementosPage({super.key});

  @override
  State<ElementosPage> createState() => _ElementosPageState();
}

class _ElementosPageState extends State<ElementosPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.black,
          //title: const Text('Tabs Demo'),
          bottom: const TabBar(
            labelColor: Colors.white, // Color del texto seleccionado
            unselectedLabelColor:
                Colors.white, // Color del texto no seleccionado
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "SI"),
              Tab(text: "NO"),
              //Tab(icon: Icon(Icons.cancel)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage("aa/background_inicio.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 280, // Altura deseada
                width: 294,
                child: Image(
                    image: AssetImage(
                  "aa/elementosPermitidos.png",
                ))),
            Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage("aa/background_inicio.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 280, // Altura deseada
                width: 294,
                child: Image(
                    image: AssetImage(
                  "aa/elementosNoPermitos.png",
                ))),
          ],
        ),
      ),
    );
  }
}
