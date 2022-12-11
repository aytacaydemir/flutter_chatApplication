import 'package:app_firebase/view/home_page.dart';
import 'package:app_firebase/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //place?
  await Firebase.initializeApp(); //place?
  /*final login = SharedPrefs().getLoginKey();*/
  final pref = await SharedPreferences.getInstance();
  final login = pref.getBool('LoginKey');

  runApp(MyApp(login: login ?? false));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.login,
  });
  final bool login;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      title: 'ITouch',
      home: login ? const HomePage() : const LoginScreen(),
    );
  }
}







      /*
                 login! ? const HomePage() : LoginScreen();
              } else {
                return LoginScreen();
              }
            }
*/
        // login ? const HomePage() : LoginScreen(),
        
  

