import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rally_fotografico/screens/detalle_concurso_screen.dart';

class ConcursosScreen extends StatelessWidget {
  const ConcursosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(title: const Text("Concursos")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('concursos')
            .where('participantes', arrayContains: uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final concursos = snapshot.data!.docs;

          if (concursos.isEmpty) {
            return const Center(child: Text('No has participado en ningún concurso.'));
          }

          return ListView.builder(
            itemCount: concursos.length,
            itemBuilder: (context, index) {
              final data = concursos[index].data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['nombre'] ?? 'Concurso'),
                subtitle: Text(data['descripcion'] ?? ''),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetalleConcursoScreen(concursoId: concursos[index].id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
