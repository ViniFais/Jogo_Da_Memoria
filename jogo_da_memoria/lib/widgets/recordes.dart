import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/pages/recordes_page.dart';
import 'package:jogo_da_memoria/theme.dart';

import '../constantes.dart';

class Recordes extends StatefulWidget {
  const Recordes({Key? key}) : super(key: key);

  @override
  State<Recordes> createState() => _RecordesState();
}

class _RecordesState extends State<Recordes> {
  showRecordes(Modo modo) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => RecordesPage(modo: modo)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Recordes',
                style: TextStyle(color: Roud6Theme.color, fontSize: 22),
              ),
            ),
            ListTile(
              title: const Text('Modo Normal'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo.normal),
            ),
            ListTile(
              title: const Text('Modo Round 6'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo.round6),
            ),
          ],
        ),
      ),
    );
  }
}
