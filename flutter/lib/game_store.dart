import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tic_attack_back/bot.dart';

part 'game_store.g.dart';

enum Marker {
  X,
  O,
  EMPTY;

  String get text => this == X
      ? 'X'
      : this == O
          ? 'O'
          : '';
}

enum GameState { OVER, WAITING_FOR_MOVE, EVALUATING }

class GameStore = _GameStoreBase with _$GameStore;

final bot = Bot(Marker.O);
const playerMarker = Marker.X;
const waitTime = Duration(milliseconds: 1500);

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

List<int>? getWinner(List<Marker> markers) {
  for (var combination in winningCombinations) {
    if (combination
        .every((i) => markers[i] == markers[combination[0]] && markers[i] != Marker.EMPTY)) {
      return combination;
    }
  }

  return null;
}

abstract class _GameStoreBase with Store {
  final markers = ObservableList<Marker>();
  @observable
  Marker attacker = playerMarker;
  @observable
  List<int>? winningCombination;
  @computed
  bool get playerTurn => attacker == playerMarker;
  @computed
  Marker? get winningPlayer => winningCombination == null ? null : markers[winningCombination![0]];
  @computed
  Marker get defender => attacker == Marker.X ? Marker.O : Marker.X;
  @computed
  String get actionText {
    print('[actionText] $gameState $playerMove $botMove $winningCombination $winningPlayer');
    if (gameState == GameState.OVER) {
      if (winningCombination == null) {
        return 'Stalemate!';
      }

      return '${winningPlayer?.text} wins!';
    }

    if (gameState == GameState.EVALUATING) {
      if (playerMove == botMove) {
        return '${attacker.text} blocked by ${defender.text}!';
      }

      return 'Hit by ${attacker.text}!';
    }

    return attacker == Marker.X ? 'Attack!' : 'Defend!';
  }

  @observable
  int? playerMove;
  @observable
  int? botMove;
  @observable
  GameState gameState = GameState.OVER;
  @observable
  int? hoveredPos;

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

  Color getHoverMarkerColor(int pos) {
    if (hoveredPos == pos &&
        markers[pos] == Marker.EMPTY &&
        playerTurn &&
        gameState == GameState.WAITING_FOR_MOVE) {
      return const Color.fromARGB(127, 99, 207, 102);
    }

    return Colors.transparent;
  }

  Color getHoverColor(int pos) {
    if (markers[pos] != Marker.EMPTY ||
        hoveredPos != pos ||
        gameState != GameState.WAITING_FOR_MOVE) {
      return Colors.transparent;
    }

    if (playerMarker == attacker) {
      return Colors.transparent;
    } else {
      return const Color.fromARGB(127, 99, 207, 102);
    }
  }

  init() {
    onNewGamePressed();
  }

  @action
  onNewGamePressed() {
    markers.clear();
    winningCombination = null;
    playerMove = null;
    botMove = null;
    gameState = GameState.WAITING_FOR_MOVE;
    for (var i = 0; i < 9; i++) {
      markers.add(Marker.EMPTY);
    }
  }

  @action
  onHoverSquare(int pos) {
    hoveredPos = pos;
  }

  @action
  onUnhoverSquare(int pos) {
    if (hoveredPos == pos) {
      hoveredPos = null;
    }
  }

  @action
  onMarkerTapped(int pos) async {
    if (gameState != GameState.WAITING_FOR_MOVE) {
      return;
    }

    if (winningCombination != null) {
      return;
    }

    if (markers[pos] != Marker.EMPTY) {
      return;
    }

    print('$pos tapped');
    playerMove = pos;
    _makeBotMove();
    await evaluateTurn();
  }

  @action
  evaluateTurn() async {
    print('Evaluating: player=$playerMove bot=$botMove');
    gameState = GameState.EVALUATING;
    if (playerMove != botMove) {
      final attackMove = playerTurn ? playerMove : botMove;
      markers[attackMove!] = playerTurn ? playerMarker : bot.marker;
    }
    await Future.delayed(waitTime);

    playerMove = null;
    botMove = null;
    _checkPlayerWon();
    _switchTurn();
  }

  @action
  _switchTurn() {
    print('state: $gameState');
    if (gameState == GameState.EVALUATING) {
      print('New turn');
      gameState = GameState.WAITING_FOR_MOVE;
    }

    attacker = attacker == Marker.X ? Marker.O : Marker.X;
  }

  @action
  _checkPlayerWon() {
    print('[_checkPlayerWon]');
    winningCombination = getWinner(markers);
    if (winningCombination != null) {
      gameState = GameState.OVER;
      print('winning combination: $winningCombination');
    } else {
      if (markers.where((m) => m == Marker.EMPTY).length == 1) {
        gameState = GameState.OVER;
      }
    }
  }

  _makeBotMove() async {
    // await Future.delayed(const Duration(seconds: 1));
    botMove = playerTurn ? bot.defend(markers) : bot.attack(markers);
  }
}
