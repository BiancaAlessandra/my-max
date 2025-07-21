import 'package:flutter/material.dart';
import 'package:mymax/globals/components.dart';
import 'package:mymax/globals/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loadTela = false;

  List movimentos = [
    (nome: 'Snatch', cargaMax: 50.0),
    (nome: 'Power Snatch', cargaMax: 55.0),
    (nome: 'Squat Snatch', cargaMax: 60.0),
    (nome: 'Hang Snatch', cargaMax: 45.0),
    (nome: 'Hang Power Snatch', cargaMax: 50.0),
    (nome: 'Muscle Snatch', cargaMax: 40.0),
    (nome: 'Snatch Balance', cargaMax: 65.0),
    (nome: 'Overhead Squat', cargaMax: 70.0),
    (nome: 'Clean', cargaMax: 90.0),
    (nome: 'Power Clean', cargaMax: 80.0),
    (nome: 'Squat Clean', cargaMax: 95.0),
    (nome: 'Hang Clean', cargaMax: 75.0),
    (nome: 'Hang Power Clean', cargaMax: 70.0),
    (nome: 'Muscle Clean', cargaMax: 60.0),
    (nome: 'Block Clean', cargaMax: 85.0),
    (nome: 'Jerk', cargaMax: 100.0),
    (nome: 'Push Jerk', cargaMax: 90.0),
    (nome: 'Split Jerk', cargaMax: 95.0),
    (nome: 'Power Jerk', cargaMax: 85.0),
    (nome: 'Squat Jerk', cargaMax: 80.0),
    (nome: 'Behind the Neck Jerk', cargaMax: 90.0),
    (nome: 'Clean and Jerk', cargaMax: 105.0),
    (nome: 'Squat Clean Thruster', cargaMax: 85.0),
    (nome: 'Snatch Complex', cargaMax: 70.0),
    (nome: 'Clean Complex', cargaMax: 90.0),
    (nome: 'Snatch Pull', cargaMax: 95.0),
    (nome: 'Clean Pull', cargaMax: 110.0),
    (nome: 'Snatch Deadlift', cargaMax: 100.0),
    (nome: 'Clean Deadlift', cargaMax: 120.0),
    (nome: 'Front Squat', cargaMax: 110.0),
    (nome: 'Overhead Squat', cargaMax: 95.0),
    (nome: 'Strict Press', cargaMax: 60.0),
    (nome: 'Push Press', cargaMax: 75.0),
    (nome: 'Split Press', cargaMax: 65.0),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: movimentos.length,
                itemBuilder: (context, index) {
                  final movimento = movimentos[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: corPadrao.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            movimento.nome,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Text(
                          '${movimento.cargaMax.toStringAsFixed(1)} kg',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            loadTela == true ? load() : Container(),
          ],
        ),
      ),
    );
  }
}
