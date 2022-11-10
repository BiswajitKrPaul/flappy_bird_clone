import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState(GameStateEnum.initial)) {
    on<GameStart>((event, emit) {
      emit(state.copyWith(gameStateEnum: GameStateEnum.running));
    });

    on<GamePaused>(
      (event, emit) =>
          emit(state.copyWith(gameStateEnum: GameStateEnum.paused)),
    );

    on<GameOver>(
      (event, emit) => emit(state.copyWith(gameStateEnum: GameStateEnum.over)),
    );
  }
}
