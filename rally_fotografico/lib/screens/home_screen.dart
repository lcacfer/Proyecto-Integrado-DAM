import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'perfil':
        Navigator.pushNamed(context, '/perfil');
        break;
      case 'subir':
        Navigator.pushNamed(context, '/subir');
        break;
      case 'admin':
        Navigator.pushNamed(context, '/admin');
        break;
      case 'salir':
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Inicio"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => _handleMenuSelection(context, value),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'perfil', child: Text('Perfil')),
              const PopupMenuItem(value: 'subir', child: Text('Subir Foto')),
              const PopupMenuItem(value: 'admin', child: Text('Administrador')),
              const PopupMenuItem(value: 'salir', child: Text('Salir')),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Temáticas disponibles:',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
