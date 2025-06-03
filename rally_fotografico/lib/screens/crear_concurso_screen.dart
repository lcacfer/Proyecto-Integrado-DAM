import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrearConcursoScreen extends StatefulWidget {
  const CrearConcursoScreen({super.key});

  @override
  State<CrearConcursoScreen> createState() => _CrearConcursoScreenState();
}

class _CrearConcursoScreenState extends State<CrearConcursoScreen> {
  final nombreController = TextEditingController();
  final descripcionController = TextEditingController();

  Future<void> _crearConcurso() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance.collection('usuarios').doc(user.email).get();
    final esAdmin = doc.data()?['isAdmin'] == true;

    if (!mounted) return; // ✅ Protección antes de usar context

    if (!esAdmin) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Solo administradores pueden crear concursos.')),
      );
      return;
    }

    await FirebaseFirestore.instance.collection('concursos').add({
      'nombre': nombreController.text,
      'descripcion': descripcionController.text,
      'participantes': [],
      'fechaCreacion': Timestamp.now(),
    });

    if (!mounted) return; // ✅ Repetimos para la segunda parte

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear Concurso")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Título del concurso'),
            ),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _crearConcurso,
              child: const Text("Crear"),
            ),
          ],
        ),
      ),
    );
  }
}
