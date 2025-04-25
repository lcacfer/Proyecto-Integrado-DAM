import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Importar tus pantallas
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializar Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rally Fotográfico',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/', // Pantalla de bienvenida
      routes: {
        '/': (context) => const WelcomeScreen(),     // Pantalla 4
        '/login': (context) => const LoginScreen(),  // Pantalla 2
        '/register': (context) => const RegisterScreen(), // Pantalla 3
        '/home': (context) => const HomeScreen(),    // Pantalla 1
      },
    );
  }
}
