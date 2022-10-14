import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/theme.dart';
import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roud 6 Memory',
      debugShowCheckedModeBanner: false,
      theme:  Roud6Theme.theme,
      home: HomePage(),
    );
  }
}
