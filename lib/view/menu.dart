import 'package:flutter/material.dart';
import 'package:meuapp/view/home_screen.dart';
import 'package:meuapp/view/feriado_screen.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text("Menu")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Cursos"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Feriados"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeriadoScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sair"),
            onTap: () {

            },
          )
        ],
      ),
    );
  }
}
