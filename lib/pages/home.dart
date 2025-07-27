import 'package:flutter/material.dart';
import 'package:mymax/globals/components.dart';
import 'package:mymax/globals/styles.dart';
import 'package:mymax/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pesquisarController = TextEditingController();
  bool loadTela = false;
  List movimentos_filtrados = [];

  List movimentos_originais = [
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
  void initState() {
    super.initState();
    movimentos_filtrados = movimentos_originais;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: corPadrao,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Image.asset('assets/images/logo.png', height: 20),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Pesquisar',
                      hintStyle: TextStyle(color: corFonte),
                      prefixIcon: Icon(Icons.search, color: corFonte),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: corFonte),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: corFonte),
                      ),
                    ),
                    style: TextStyle(color: corFonte),
                    controller: pesquisarController,
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          movimentos_filtrados = movimentos_originais
                              .where(
                                (m) => m.nome.toLowerCase().contains(
                                  value.toLowerCase(),
                                ),
                              )
                              .toList();
                        } else {
                          movimentos_filtrados = movimentos_originais;
                        }
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: movimentos_filtrados.length,
                      itemBuilder: (context, index) {
                        final movimento = movimentos_filtrados[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  nome: movimento.nome,
                                  cargaMax: movimento.cargaMax,
                                  dataAtualizacao:
                                      DateTime.now(), // depois você pode salvar isso por movimento
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: corPadrao.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      movimento.nome,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: corFonte,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '${movimento.cargaMax.toStringAsFixed(1)} kg',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: corFonte,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            loadTela == true ? load() : Container(),
          ],
        ),
      ),
    );
  }
}
