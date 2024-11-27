import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'game_store.g.dart';

enum Marker {
  X,
  O,
  EMPTY;

  getText() => this == X
      ? 'X'
      : this == O
          ? 'O'
          : '';
}

class GameStore = _GameStoreBase with _$GameStore;

abstract class _GameStoreBase with Store {
  final markers = ObservableList<Marker>();
  @observable
  Marker currentPlayer = Marker.X;
  @observable
  List<int>? winningCombination;
  @computed
  Marker? get winningPlayer => winningCombination == null ? null : markers[winningCombination![0]];

  Color getMarkerColor(int pos) {
    if (winningCombination?.contains(pos) ?? false) {
      return Colors.red;
    }

    if (markers[pos] == Marker.X) {
      return Colors.green;
    }

    if (markers[pos] == Marker.O) {
      return Colors.purple;
    }

    return Colors.transparent;
  }

  init() {
    onNewGamePressed();
  }

  @action
  onNewGamePressed() {
    markers.clear();
    winningCombination = null;
    for (var i = 0; i < 9; i++) {
      markers.add(Marker.EMPTY);
    }
  }

  @action
  onMarkerTapped(int pos) {
    if (winningCombination != null) {
      return;
    }

    print('$pos tapped');
    markers[pos] = currentPlayer;
    _checkPlayerWon();

    if (winningCombination == null) {
      currentPlayer = currentPlayer == Marker.X ? Marker.O : Marker.X;
    }
  }

  _checkPlayerWon() {
    const winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combination in winningCombinations) {
      if (combination
          .every((i) => markers[i] == markers[combination[0]] && markers[i] != Marker.EMPTY)) {
        winningCombination = combination;
        print('winningCombination: $combination');
        break;
      }
    }
  }
}
