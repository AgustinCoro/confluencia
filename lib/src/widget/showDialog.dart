//import 'package:conciertos2/constant.dart';
import 'package:conciertos2/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDialogPage {
  //EL valor 0 es para un mensaje de carga de operacion
  //EL valor 1 es para un mensaje de una operacion finalizada ya sea hecha satisfactoriamente o con un error
  //EL valor 2 es para un mensaje de confimacion de una operacion
  //static Future<void> showMensajeDialog(BuildContext context, String titulo, String message, int b) async {
  static Future<void> politicaPrivacidad(
      BuildContext context, String titulo, String message, int b) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text(message),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('');
                  opcionSeleccionadaPrivacidad = true;
                },
                child: Text("Accept and Close")),
            ElevatedButton(
              onPressed: () {
                // Navegar al enlace de la política de privacidad
                abrirEnlace(
                    "https://www.fiestaconfluencia.com.ar/politicas-de-privacidad");
              },
              child: Text("More Information"),
            ),
          ]),
        );
      },
    );
  }

  static Future<void> subsidioMensaje(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Aviso"),
          content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text(
              "SI SOS USUARIO RESIDENCIAL Y RECIBIS EL SUBSIDIO (T1R - N2) SIN HABER REALIZADO NINGÚN TRAMITE",
              style: TextStyle(
                color: Color.fromARGB(255, 27, 14, 121),
              ),
            ),
            Text(
              "TE INFORMAMOS QUE PARA MANTENER EL SUBSIDIO TENDRÁS QUE COMPLETAR EL FORMULARIO RASE EN FORMA ONLINE EN https://www.argentina.gob.ar/subsidios. HASTA EL 04 DE SEPTIEMBRE DEL 2024.",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "CASO CONTRARIO CORRES EL RIESGO DE PERDER ESE BENEFICIO",
              style: TextStyle(
                color: Colors.red,
              ),
            )
          ]),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop('');
              },
            ),
          ],
        );
      },
    );
  }
}

Future<void> abrirEnlace(String direccion) async {
  final Uri _url = Uri.parse(direccion);
  if (!await launchUrl(
    _url,
    mode: LaunchMode.externalNonBrowserApplication,
  )) {
    throw 'No se pudo iniciar la pagina $_url';
  }
}
