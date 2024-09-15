import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../controller/feriado_controller.dart';


String formatarData(String data) {
  final DateTime dateTime = DateTime.parse(data);
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

class FeriadoScreen extends StatefulWidget {
  @override
  _FeriadoScreenState createState() => _FeriadoScreenState();
}

class _FeriadoScreenState extends State<FeriadoScreen> {
  late TextEditingController _yearController; 
  late String selectedYear;

  @override
  void initState() {
    super.initState();
    selectedYear = DateTime.now().year.toString();
    _yearController = TextEditingController(text: selectedYear);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FeriadoController>(context, listen: false).fetchFeriados(int.parse(selectedYear));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Feriados Nacionais $selectedYear'),
            SizedBox(
              width: 80,
              child: TextField(
                controller: _yearController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Ano',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
                onSubmitted: (value) {
                  
                  setState(() {
                    selectedYear = value;
                  });
                  Provider.of<FeriadoController>(context, listen: false)
                      .fetchFeriados(int.parse(value));
                },
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF3AA2B7),
      ),
      body: Consumer<FeriadoController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: controller.feriados.length,
            itemBuilder: (context, index) {
              final feriado = controller.feriados[index];
              return Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  leading: Icon(Icons.event, color: const Color(0xFF3AA2B7), size: 36),
                  title: Text(
                    feriado.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    formatarData(feriado.date),
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}