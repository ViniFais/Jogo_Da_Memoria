import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/game_settings.dart';
import 'package:jogo_da_memoria/models/gameplay.dart';
import '../constantes.dart';
import '../widgets/card_nivel.dart';

class NivelPage extends StatelessWidget {
  final Modo modo;
  const NivelPage({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final niveis =
        GameSettings.niveis.map((n) => CardNivel(gamePlay: GamePlay(modo: modo, nivel: n))).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nivel do jogo',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 48),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(24),
          children: niveis,
        ),
      ),
    );
  }
}
