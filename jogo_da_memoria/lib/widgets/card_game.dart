import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/controllers/game_controller.dart';
import 'package:jogo_da_memoria/models/game_opcao.dart';
import 'package:provider/provider.dart';
import '../constantes.dart';
import '../theme.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final GameOpcao gameOpcao;
  const CardGame({Key? key, required this.modo, required this.gameOpcao})
      : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    animation.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  flipCard() {
    final game = context.read<GameController>();
    if (!animation.isAnimating &&
        !widget.gameOpcao.matched &&
        !widget.gameOpcao.selected &&
        !game.jogadaCompleta) {
      animation.forward();
      game.escolher(widget.gameOpcao, resetCard);
      //Timer(const Duration(seconds: 2), () => animation.reverse());
    }
  }

  resetCard() {
    animation.reverse();
  }

//FUNÇÃO QUE FAZ A TROCA DE IMAGEM NA HORA DA ANIMAÇÃO
  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi) {
      return AssetImage('images/${widget.gameOpcao.opcao.toString()}.png');
    } else {
      return widget.modo == Modo.normal
          ? const AssetImage('images/card_normal.png')
          : const AssetImage('images/card_round.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, _) {
          //Definando Angulo em que a carta vai movimentar
          //Utilizando o PI
          final angulo = animation.value * pi;
          //Criando transformações
          //Normalmente criado utlizando matrix de 4 dimenções
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angulo);

          return GestureDetector(
            onTap: () => flipCard(),
            child: Transform(
              transform: transform,
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                border: Border.all(
                  color: widget.modo == Modo.normal
                      ? Colors.white
                      : Roud6Theme.color,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: getImage(angulo),
                ),
              )),
            ),
          );
        });
  }
}
