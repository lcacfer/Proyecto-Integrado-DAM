import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MisFotosScreen extends StatelessWidget {
  const MisFotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(title: const Text("Mis Fotos")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('fotos')
            .where('usuarioId', isEqualTo: uid)
            .orderBy('fecha', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final fotos = snapshot.data!.docs;

          return ListView.builder(
            itemCount: fotos.length,
            itemBuilder: (context, index) {
              final data = fotos[index].data() as Map<String, dynamic>;
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: data['url'] != null
                      ? Image.network(data['url'], width: 50, height: 50, fit: BoxFit.cover)
                      : const Icon(Icons.photo),
                  title: Text(data['titulo'] ?? 'Sin título'),
                  subtitle: Text('Estado: ${data['estado']}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
