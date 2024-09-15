import 'package:flutter/material.dart';
import '../model/feriado_repository.dart';
import '../model/feriado_model.dart';

class FeriadoController extends ChangeNotifier {
  final FeriadoRepository repository;
  List<Feriado> feriados = [];
  bool isLoading = true;

  FeriadoController(this.repository);

  Future<void> fetchFeriados(int year) async {
    isLoading = true;
    notifyListeners();
    try {
      feriados = await repository.fetchFeriados(year);
    } catch (e) {
      print('Erro ao buscar feriados: $e');
    }
    isLoading = false;
    notifyListeners();
  }
}