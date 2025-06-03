import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final usuario = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final nombre = usuario?.displayName ?? 'Sin nombre';
    final correo = usuario?.email ?? 'Sin correo';

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text("Perfil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Text("Usuario: $nombre", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Correo: $correo", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.lock),
              label: const Text("Cambiar contraseña"),
              onPressed: () {
                Navigator.pushNamed(context, '/cambiar_contrasena');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.photo_library),
              label: const Text("Mis fotos"),
              onPressed: () {
                Navigator.pushNamed(context, '/misfotos');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.emoji_events),
              label: const Text("Concursos"),
              onPressed: () {
                Navigator.pushNamed(context, '/concursos');
              },
            ),
          ],
        ),
      ),
    );
  }
}
