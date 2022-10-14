import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/constantes.dart';
import 'package:jogo_da_memoria/pages/nivel_page.dart';
import 'package:jogo_da_memoria/widgets/recordes.dart';
import 'package:jogo_da_memoria/widgets/startbutton.dart';
import '../theme.dart';
import '../widgets/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              StartButton(
                  title: 'Modo Normal', color: Colors.white, 
                  action: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const NivelPage(modo: Modo.normal)))
                  }),
              StartButton(
                  title: 'Modo Round 6',
                  color: Color.fromARGB(255, 233, 30, 99),
                  action: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NivelPage(modo: Modo.round6)))}),
                  const SizedBox(height: 60,),
                  const Recordes()
            ]),
      ),
    );
  }
}
