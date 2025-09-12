import 'dart:convert';

class GameState {
  final int playerHealth;
  final int monsterHealth;
  final int attackCount;

  const GameState({
    this.playerHealth = 100,
    this.monsterHealth = 100,
    this.attackCount = 0,
  });

  String? get winner {
    if (monsterHealth <= 0) return "Player";
    if (playerHealth <= 0) return "Monster";
    return null;
  }

  bool get disabledButtons {
    if (winner != null) return true;
    return false;
  }

  GameState copyWith({
    int? playerHealth,
    int? monsterHealth,
    int? attackCount,
  }) {
    return GameState(
      playerHealth: playerHealth ?? this.playerHealth,
      monsterHealth: monsterHealth ?? this.monsterHealth,
      attackCount: attackCount ?? this.attackCount,
    );
  }

  @override
  String toString() {
    return jsonEncode({
      'playerHealth': playerHealth,
      'monsterHealth': monsterHealth,
      'attackCount': attackCount,
      'winner': winner,
    });
  }
}
