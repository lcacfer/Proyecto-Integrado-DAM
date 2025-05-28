import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioController = TextEditingController();
    final correoController = TextEditingController();
    final contrasenaController = TextEditingController();
    final nuevaContrasenaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text("Perfil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: usuarioController,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: correoController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: contrasenaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            TextField(
              controller: nuevaContrasenaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña nueva'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
