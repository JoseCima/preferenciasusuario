import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:preferenciasusuario/src/pages/setting_page.dart';

class MenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: ListView(
         padding: EdgeInsets.zero,
         children: <Widget>[
           DrawerHeader(
             child: Container(),
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/menu-img.jpg'),
                 fit: BoxFit.cover
                 ),
             ), 
             ),
             //Opciones dek Menu
             ListTile(
               leading: Icon(Icons.pages, color: Colors.pink[300]),
               title: Text('Home'),
               onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
             ),
             ListTile(
               leading: Icon(Icons.party_mode, color: Colors.pink[300]),
               title: Text('Party Mode'),
               onTap: (){},
             ),
             ListTile(
               leading: Icon(Icons.people, color: Colors.pink[300]),
               title: Text('People'),
               onTap: (){},
             ),
             ListTile(
               leading: Icon(Icons.settings, color: Colors.pink[300]),
               title: Text('Settings'),
               onTap: (){
                 //Navigator.pop(context),//Para cerrar automaticamente 
                 //Navigator.pushNamed(context, SettingsPage.routeName)

                
                 Navigator.pushReplacementNamed(context, SettingsPage.routeName);//Esta es la pagina principal(No deja retornar a la pantalla anterior)
                 
               }//;Mueve el navigator a la pantalla de Settings
             ),

         ],
       ),//Se manejan listview para poder hacer scroll en dado caso de que existan varias opciones en nuestro menu
     );
  }
}