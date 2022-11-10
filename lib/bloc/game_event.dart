part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GameStart extends GameEvent {}

class GamePaused extends GameEvent {}

class GameOver extends GameEvent {}
