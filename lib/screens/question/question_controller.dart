import 'package:flutter/material.dart';

class QuestionController {
  final int numeroPregunta = 4;
  final int totalQuestions = 29;
  // Definir la pregunta y las opciones
  final String question = "Qual es la capital de España?";
  final List<String> options = ["Barcelona", "Madrid", "Sevilla", "Valencia"];
  
  // Índice de la opción correcta
  final int correctAnswerIndex = 1; // Madrid es la respuesta correcta

  // Método para verificar si la respuesta es correcta
  bool isCorrect(int selectedIndex) {
    return selectedIndex == correctAnswerIndex;
  }

  void goToNextQuestion(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Next question'),
        content: const Text(''),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el popup
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
}
