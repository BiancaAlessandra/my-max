import 'package:flutter/material.dart';
import 'package:mymax/globals/components.dart';
import 'package:mymax/globals/styles.dart';

class DetailPage extends StatefulWidget {
  final String nome;
  final double cargaMax;
  final DateTime dataAtualizacao;

  const DetailPage({
    super.key,
    required this.nome,
    required this.cargaMax,
    required this.dataAtualizacao,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController cargaController = TextEditingController();
  bool loadTela = false;

  @override
  void initState() {
    super.initState();
    cargaController = TextEditingController(
      text: widget.cargaMax.toStringAsFixed(1),
    );
  }

  @override
  void dispose() {
    cargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: corPadrao,
        elevation: 0,
        centerTitle: true,
        title: Image.asset('assets/images/logo.png', height: 20),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: corBranco),
          onPressed: () {
            // faça algo antes
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                // Nome do movimento
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.nome,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: corFonte,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Peso máximo centralizado em destaque
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: corPadrao.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: corPadrao, width: 1.5),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Peso Máximo',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: cargaController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: corPadrao,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          suffixText: 'kg',
                          suffixStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Data de atualização
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Última atualização: ${_formatarData(widget.dataAtualizacao)}',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                Spacer(),

                //Botão
                botaoPadrao(onTap: () {}, texto: "Salvar"),
              ],
            ),
          ),
          loadTela == true ? load() : Container(),
        ],
      ),
    );
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }
}
