import 'package:flutter/material.dart';

class EditQuizScreen extends StatelessWidget {
  const EditQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Quiz'),
      ),
      body: const Center(
        child: Text(
          'Editando Cuestionario',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
