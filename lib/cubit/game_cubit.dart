import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monster_slayer_cubit/models/game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState());

  final math.Random _random = math.Random();
  int _getRandom(int min, int max) => min + _random.nextInt(max - min + 1);

  void attackMonster() {
    if (state.playerHealth > 0) {
      int damage = _getRandom(5, 10);
      int newMonsterHealth = math.max(state.monsterHealth - damage, 0);
      GameState newState = state.copyWith(
        monsterHealth: newMonsterHealth,
        attackCount: state.attackCount + 1,
      );
      emit(newState);
      attackPlayer();
    }
  }

  void attackPlayer() {
    if (state.monsterHealth > 0) {
      int damage = _getRandom(8, 12);
      int newPlayerHealth = math.max(state.playerHealth - damage, 0);
      GameState newState = state.copyWith(playerHealth: newPlayerHealth);
      emit(newState);
    }
  }

  void specialAttack() {
    if (state.monsterHealth > 0) {
      int damage = _getRandom(10, 15);
      int newMonsterHealth = math.max(state.monsterHealth - damage, 0);
      GameState newState = state.copyWith(
        attackCount: 0,
        monsterHealth: newMonsterHealth,
      );
      emit(newState);
      attackPlayer();
    }
  }

  void heal() {
    int repair = _getRandom(8, 15);
    int newPlayerHealth = math.min(state.playerHealth + repair, 100);
    GameState newState = state.copyWith(
      playerHealth: newPlayerHealth,
      attackCount: 0,
    );
    emit(newState);
    attackPlayer();
  }

  void surrender() {
    _reset();
  }

  void _reset() {
    GameState newState = state.copyWith(
      playerHealth: 100,
      monsterHealth: 100,
      attackCount: 0,
    );
    emit(newState);
  }
}
