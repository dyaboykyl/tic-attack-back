import 'dart:math';

import 'package:tic_attack_back/game_store.dart';

final random = Random();

class Bot {
  final Marker marker;

  Bot(this.marker);

  int attack(List<Marker> board) {
    final List<int> positions = [];

    for (int i = 0; i < board.length; i++) {
      if (board[i] == Marker.EMPTY) {
        positions.add(i);
      }
    }

    return positions[random.nextInt(positions.length)];
  }

  int defend(List<Marker> board) {
    return attack(board);
  }
}
