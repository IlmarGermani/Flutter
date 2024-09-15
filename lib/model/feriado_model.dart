class Feriado {
  final String name;
  final String date;

  Feriado({required this.name, required this.date});

  factory Feriado.fromJson(Map<String, dynamic> json) {
    return Feriado(
      name: json['name'],
      date: json['date'],
    );
  }
}