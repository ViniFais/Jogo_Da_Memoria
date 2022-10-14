import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jogo_da_memoria/controllers/game_controller.dart';
import 'package:jogo_da_memoria/repositories/recordes_repository.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MultiProvider(
    providers: [
      Provider<RecordesRepository>(
        create: (_) => RecordesRepository(),
      ),
      ProxyProvider<RecordesRepository, GameController>(update: (_, repo, __) => GameController(recordesRepository: repo))
    ],
    child: const App(),
  ));
}
