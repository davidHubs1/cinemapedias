import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLOadingMessage() {
    const messages = <String>[
      '🦸 Hola Bienvenido xd 🦸',
      'Cargando Peliculas',
      '🍿 Comprando Palomitas 🍿',
      'Cargando Populares',
      'Ya meroo....🥹',
      'Esto esta tardando más de lo esperado 😭',
      'Espere Un Rato Más Coffa 👉👈'
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('espere porfavor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLOadingMessage(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
