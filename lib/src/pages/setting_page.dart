import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuario/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {


//haciendo la referencia

  static final String routeName ='settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = false;
  int? _genero;
  String _nombre = 'José';

  //Poner el nombre por defecto al abrir la app
   late TextEditingController _textController;
   final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

   
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textController = new TextEditingController( text: prefs.nombreUsuario);
  }


  


  void _setSelectedRadio(int? valor){
    //grabar espacio en memoria

    //prefs.setInt('genero', valor!.toInt());
    prefs.genero = valor!;

    _genero = int.parse(valor.toString());
    setState(() {
      
    });
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
         title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.pink[300] : Colors.blue[300],

       ),

       drawer: MenuWidget(),
       body: ListView(
         children: <Widget>[
           Container(
             padding: EdgeInsets.all(5.0),
             child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),

           ),

           Divider(),

           SwitchListTile(
              value: _colorSecundario,
              title: Text('Color Secundario'),
              onChanged: ( value ){
                
                setState(() {
                  //Redibujando
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              }
              ),

           RadioListTile(
             value: 1,
             title: Text('Masculino'), 
             groupValue: _genero, 
             onChanged:_setSelectedRadio
           ),

           RadioListTile(
             value: 2,
             title: Text('Femenino'), 
             groupValue: _genero, 
             onChanged: _setSelectedRadio
           ),

           Divider(),

           Container(
             padding: EdgeInsets.symmetric(horizontal: 20.0),
             child: TextField(
               controller: _textController,
               decoration: InputDecoration(
                 labelText: 'Nombre',
                 helperText: 'Nombre de la persona usando el télefono'

               ),

               //leyendo lo que la persona escribió
               onChanged: ( value ){
                 prefs.nombreUsuario =  value;
               },
             ),
           )

         ],
       )
    );
  }
}