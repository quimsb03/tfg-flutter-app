import 'package:flutter/material.dart';
import 'dart:async'; // Para usar Timer
import 'question_controller.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final QuestionController controller = QuestionController();

  int secondsLeft = 30; 
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsLeft > 0) {
        setState(() {
          secondsLeft--;
        });
      } else {
        timer.cancel(); 
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pregunta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70, 
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(25, 33, 150, 243),
                    border: Border.all(
                      color: Colors.blue, 
                      width: 3, 
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${controller.numeroPregunta}/${controller.totalQuestions}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    ' ${controller.question}',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '$secondsLeft s', 
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, 
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                padding: const EdgeInsets.all(16),
                childAspectRatio: 2.5, 
                children: List.generate(controller.options.length, (index) {
                  final colors = [
                    Colors.lightBlue.shade400,
                    Colors.teal.shade400,
                    Colors.amber.shade400,
                    Colors.red.shade400,
                  ];
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[index % colors.length],
                      foregroundColor: Colors.black, 
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ), 
                      ),
                      elevation: 2, 
                    ),
                    onPressed: () {
                      bool correct = controller.isCorrect(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(correct ? "¡Correcto!" : "Incorrecto"),
                        ),
                      );
                    },
                    child: Text(
                      controller.options[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  controller.goToNextQuestion(context);
                },
                child: const Text(
                  'Next question',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
