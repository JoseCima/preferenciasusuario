import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuario/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {


//haciendo la referencia

  static final String routeName ='home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    

    


    return Scaffold(


       appBar: AppBar(
         title: Text('Preferencias de Usuario'),
         backgroundColor: (prefs.colorSecundario) ? Colors.pink[300] : Colors.blue[300],

       ),

       drawer: MenuWidget(),
       body: Column(


         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[

            Text('Color secundario: ${prefs.colorSecundario}'),
            Divider(),
            Text('Género: ${prefs.genero}'),
            Divider(),
            Text('Nombre Usuario: ${prefs.nombreUsuario}'),
            Divider(),
         ],
       ),
    );
  }
}