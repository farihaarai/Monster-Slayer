import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monster_slayer_cubit/app.dart';
import 'package:monster_slayer_cubit/game_observer.dart';

void main() {
  Bloc.observer = const GameObserver();
  runApp(const MonsterSlayer());
}
