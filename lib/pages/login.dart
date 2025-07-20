import 'package:flutter/material.dart';
import 'package:mymax/globals/components.dart';
import 'package:mymax/globals/server.dart';
import 'package:mymax/globals/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loadTela = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/logo.png'),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  corPadrao.withOpacity(0.9),
                  corPadrao.withOpacity(0.3),
                ],
              ),
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 320,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // CPF
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'CPF',
                          hintStyle: TextStyle(color: corBranco),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: corBranco,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: corBranco),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: corBranco),
                          ),
                        ),
                        style: TextStyle(color: corBranco),
                      ),
                      SizedBox(height: 20),
                      // Senha
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          hintStyle: TextStyle(color: corBranco),
                          prefixIcon: Icon(Icons.lock, color: corBranco),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: corBranco),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: corBranco),
                          ),
                        ),
                        style: TextStyle(color: corBranco),
                      ),
                      SizedBox(height: 20),
                      //Botão
                      botaoPadrao(
                        onTap: () async {
                          setState(() {
                            loadTela = true;
                          });
                          try {
                            final dados = await buscarDados(
                              "login?documento=51276847807&senha=12345",
                            );
                            print(dados);
                          } catch (e) {
                            print('Erro ao obter dados: $e');
                          } finally {
                            setState(() {
                              loadTela = false;
                            });
                          }
                        },
                        texto: "Entrar",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          loadTela == true ? load() : Container(),
        ],
      ),
    );
  }
}
