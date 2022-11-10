part of 'game_bloc.dart';

enum GameStateEnum { initial, over, paused, running }

class GameState extends Equatable {
  final GameStateEnum gameStateEnum;

  const GameState(this.gameStateEnum);

  @override
  List<Object?> get props => [gameStateEnum];

  GameState copyWith({
    GameStateEnum? gameStateEnum,
  }) {
    return GameState(
      gameStateEnum ?? this.gameStateEnum,
    );
  }
}
