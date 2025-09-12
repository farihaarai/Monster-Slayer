import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monster_slayer_cubit/cubit/game_cubit.dart';
import 'package:monster_slayer_cubit/views/game_view.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => GameCubit(), child: GameView());
  }
}
