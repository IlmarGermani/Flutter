import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/feriado_model.dart';

class FeriadoRepository {
  Future<List<Feriado>> fetchFeriados(int year) async {
    final response = await http.get(Uri.parse('https://brasilapi.com.br/api/feriados/v1/$year'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Feriado.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar feriados');
    }
  }
}

