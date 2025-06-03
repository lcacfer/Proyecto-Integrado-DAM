import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DetalleConcursoScreen extends StatefulWidget {
  final String concursoId;
  const DetalleConcursoScreen({super.key, required this.concursoId});

  @override
  State<DetalleConcursoScreen> createState() => _DetalleConcursoScreenState();
}

class _DetalleConcursoScreenState extends State<DetalleConcursoScreen> {
  bool isAdmin = false;
  final _tituloController = TextEditingController();
  final _descripcionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _verificarAdmin();
    _cargarDatos();
  }

  Future<void> _verificarAdmin() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance.collection('usuarios').doc(user.email).get();
    setState(() {
      isAdmin = doc.data()?['isAdmin'] == true;
    });
  }

  Future<void> _cargarDatos() async {
    final doc = await FirebaseFirestore.instance.collection('concursos').doc(widget.concursoId).get();
    final data = doc.data();
    if (data != null) {
      _tituloController.text = data['nombre'] ?? '';
      _descripcionController.text = data['descripcion'] ?? '';
    }
  }

  Future<void> _guardarCambios() async {
    await FirebaseFirestore.instance.collection('concursos').doc(widget.concursoId).update({
      'nombre': _tituloController.text,
      'descripcion': _descripcionController.text,
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Concurso actualizado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalle del Concurso")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: const InputDecoration(labelText: 'Título'),
              enabled: isAdmin,
            ),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
              enabled: isAdmin,
            ),
            const SizedBox(height: 20),
            if (isAdmin)
              ElevatedButton(
                onPressed: _guardarCambios,
                child: const Text("Guardar Cambios"),
              ),
          ],
        ),
      ),
    );
  }
}
