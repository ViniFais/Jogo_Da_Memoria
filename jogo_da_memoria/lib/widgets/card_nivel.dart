import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/models/gameplay.dart';
import 'package:provider/provider.dart';
import '../constantes.dart';
import 'package:jogo_da_memoria/theme.dart';
import '../controllers/game_controller.dart';
import '../pages/game_page.dart';

class CardNivel extends StatelessWidget {
  final GamePlay gamePlay;
  const CardNivel({Key? key, required this.gamePlay}) : super(key: key);

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => GamePage(gamePlay: gamePlay)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                gamePlay.modo == Modo.normal ? Colors.white : Roud6Theme.color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: gamePlay.modo == Modo.normal
              ? Colors.transparent
              : Roud6Theme.color.withOpacity(.6),
        ),
        child: Center(
            child: Text(
          gamePlay.nivel.toString(),
          style: TextStyle(fontSize: 30),
        )),
      ),
    );
  }
}
