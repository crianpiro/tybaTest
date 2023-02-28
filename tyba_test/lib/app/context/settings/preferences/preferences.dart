import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:
  Inicializar en el main
  WidgetsFlutterBinding.ensureInitialized();
    final prefs = new Preferences();
    await prefs.initPrefs();
    
    Recuerden que el main() debe de ser async {...
*/

class Preferences {
  static final Preferences _instancia = Preferences._internal();

  factory Preferences() {
    return _instancia;
  }

  SharedPreferences? _prefs;

  Preferences._internal();


  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get universities {
    return _prefs!.getString('universities') ?? "";
  }

  set universities( String value ) {
    _prefs!.setString('universities', value);
  }
}
