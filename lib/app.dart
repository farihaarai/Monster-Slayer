import 'package:flutter/material.dart';
import 'package:monster_slayer_cubit/views/game_page.dart';

class MonsterSlayer extends StatelessWidget {
  const MonsterSlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamePage(),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
        useMaterial3: false,
      ),
    );
  }
}
