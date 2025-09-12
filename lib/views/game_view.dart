import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monster_slayer_cubit/cubit/game_cubit.dart';
import 'package:monster_slayer_cubit/models/game_state.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(child: Text("Monster")),
            SizedBox(height: 20),
            BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                return Text('${state.monsterHealth}');
              },
            ),
            SizedBox(height: 20),
            BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                return state.winner != null
                    ? Text('${state.winner} Wins 🎉')
                    : SizedBox();
              },
            ),
            SizedBox(height: 20),
            Card(child: Text("Player")),
            SizedBox(height: 20),
            BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                return Text('${state.playerHealth}');
              },
            ),
            SizedBox(height: 20),

            BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                var cubit = BlocProvider.of<GameCubit>(context);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: state.disabledButtons
                          ? null
                          : cubit.attackMonster,
                      child: Text("Attack"),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed:
                          (state.attackCount >= 2 && !state.disabledButtons)
                          ? cubit.specialAttack
                          : null,

                      child: Text("Special Attack"),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: state.disabledButtons ? null : cubit.heal,
                      child: Text("Heal"),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: cubit.surrender,
                      child: state.disabledButtons
                          ? Text("Reset")
                          : Text("Surrender"),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
