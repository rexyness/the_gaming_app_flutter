import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';

@Freezed()
class Game with _$Game {
  const factory Game({
    required String title,
    required int followers,
    required String imageUrl,
  }) = _Game;
}
