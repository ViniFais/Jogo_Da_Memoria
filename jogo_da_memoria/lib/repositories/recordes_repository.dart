import 'package:hive/hive.dart';
import 'package:jogo_da_memoria/constantes.dart';
import 'package:mobx/mobx.dart';
import '../models/gameplay.dart';
part 'recordes_repository.g.dart';

class RecordesRepository = RecordesRepositoryBase with _$RecordesRepository;

abstract class RecordesRepositoryBase with Store {
  late final Box _recordes;
  late final GamePlay _gamePlay;
  @observable
  Map recordesRound6 = {};
  @observable
  Map recordesNormal = {};

  RecordesRepositoryBase() {
    _initRepository();
  }

  _initRepository() async {
    await _initDatabase();
    await _loadRecordes();
  }

  _initDatabase() async {
    _recordes = await Hive.openBox('gameRecordes');
  }

  @action
  _loadRecordes() {
    recordesNormal = _recordes.get(Modo.normal.toString()) ?? {};
    recordesNormal = _recordes.get(Modo.round6.toString()) ?? {};
  }

  updateRecordes({required GamePlay gamePlay, required int score}) {
    final key = gamePlay.modo.toString();

    if (gamePlay.modo == Modo.normal &&
        (recordesNormal[gamePlay.nivel] == null ||
            score < recordesNormal[gamePlay.nivel])) {
      recordesNormal[gamePlay.nivel] = score;
      _recordes.put(key, recordesNormal);
    } else if (gamePlay.modo == Modo.round6 &&
        (recordesRound6[gamePlay.nivel] == null ||
            score > recordesRound6[gamePlay.nivel])) {
      recordesRound6[gamePlay.nivel] = score;
      _recordes.put(key, recordesRound6);
    }
  }
}
