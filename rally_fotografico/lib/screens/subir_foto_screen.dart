import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';


class SubirFotoScreen extends StatefulWidget {
  const SubirFotoScreen({super.key});

  @override
  State<SubirFotoScreen> createState() => _SubirFotoScreenState();
}

class _SubirFotoScreenState extends State<SubirFotoScreen> {
  final tituloController = TextEditingController();
  final descripcionController = TextEditingController();

  File? _imagenSeleccionada;

  Future<void> _seleccionarImagen() async {
    final picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(source: ImageSource.gallery);

    if (imagen != null) {
      setState(() {
        _imagenSeleccionada = File(imagen.path);
      });
    }
  }

  void _subirFoto() async {
    try {
      await FirebaseFirestore.instance.collection('fotos').add({
        'titulo': tituloController.text,
        'descripcion': descripcionController.text,
        'url': 'https://via.placeholder.com/150', 
        'estado': 'pendiente',
        'fecha': Timestamp.now(),
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Foto simulada subida con éxito')),
      );

      tituloController.clear();
      descripcionController.clear();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Subir Foto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            const SizedBox(height: 20),
            _imagenSeleccionada != null
                ? Image.file(_imagenSeleccionada!, height: 200)
                : const Text('Ninguna imagen seleccionada'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _seleccionarImagen,
              icon: const Icon(Icons.image),
              label: const Text('Seleccionar imagen'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _subirFoto,
              child: const Text('Subir'),
            ),
          ],
        ),
      ),
    );
  }
}
