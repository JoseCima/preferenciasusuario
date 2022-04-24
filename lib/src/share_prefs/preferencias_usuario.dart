import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final PreferenciasUsuario _instancia =  new PreferenciasUsuario._internal();

  factory PreferenciasUsuario (){
    return _instancia;
  }


  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;
  
  initPrefs() async{

  this._prefs = await SharedPreferences.getInstance();

  }

   //Ninguna de estas propiedades se usa

  late bool _colorsecundario;
  late int _genero;
  late String _nombre;


  //GETTERS AND SETTERS

  int get genero{
    return _prefs.getInt('genero') ?? 1;

  }

  set genero( int value){
_prefs.setInt('genero', value);
  }

  bool get colorSecundario{
 
     return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
  }

  String get nombreUsuario{
 
     return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value){
    _prefs.setString('colorSecundario', value);
  }




}