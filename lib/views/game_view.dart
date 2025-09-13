import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monster_slayer_cubit/cubit/game_cubit.dart';
import 'package:monster_slayer_cubit/models/game_state.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("⚔ Monster Slayer"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<GameCubit, GameState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<GameCubit>(context);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Monster Section
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  color: Colors.red[50],
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          "👹 Monster",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: state.monsterHealth / 100,
                          backgroundColor: Colors.grey[300],
                          color: Colors.red,
                          minHeight: 20,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${state.monsterHealth} %",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Winner text
                if (state.winner != null)
                  Text(
                    '${state.winner} Wins 🎉',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                const SizedBox(height: 30),

                // Player Section
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          "🧑 Player",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: state.playerHealth / 100,
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                          minHeight: 20,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${state.playerHealth} %",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                // Buttons Section
                Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: state.disabledButtons
                          ? null
                          : cubit.attackMonster,
                      icon: const Icon(Icons.sports_martial_arts),
                      label: const Text("Attack"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed:
                          (state.attackCount >= 2 && !state.disabledButtons)
                          ? cubit.specialAttack
                          : null,
                      icon: const Icon(Icons.flash_on),
                      label: const Text("Special Attack"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: state.disabledButtons ? null : cubit.heal,
                      icon: const Icon(Icons.healing),
                      label: const Text("Heal"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: cubit.surrender,
                      icon: Icon(
                        state.disabledButtons ? Icons.refresh : Icons.flag,
                      ),
                      label: Text(
                        state.disabledButtons ? "Reset" : "Surrender",
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
