import 'dart:convert';
import 'package:http/http.dart' as http;

var conexao = "http://192.168.0.110:8080/mymax/";

Future<dynamic> buscarDados(String url) async {
  print(Uri.parse(conexao + url));
  try {
    final response = await http.get(Uri.parse(conexao + url));
    print(response.toString());
    if (response.statusCode == 200) {
      final dados = jsonDecode(response.body);
      return dados;
    } else {
      throw Exception('Erro ao carregar dados: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro na requisição: $e');
    rethrow;
  }
}
