import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meuapp/view/home_screen.dart';
import 'package:meuapp/view/login_screen.dart';
import 'package:meuapp/view/feriado_screen.dart';
import 'package:meuapp/controller/feriado_controller.dart';
import 'package:meuapp/model/feriado_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FeriadoController(FeriadoRepository()), 
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                foregroundColor: MaterialStatePropertyAll(Colors.white)),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: Colors.deepPurple,
            background: Colors.grey[100],
          ),
          useMaterial3: true,
        ),
        home: LoginScreen(),
        routes: {
          '/feriados': (context) => FeriadoScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}