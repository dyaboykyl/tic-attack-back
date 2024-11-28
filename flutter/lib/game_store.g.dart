// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameStore on _GameStoreBase, Store {
  Computed<bool>? _$playerTurnComputed;

  @override
  bool get playerTurn =>
      (_$playerTurnComputed ??= Computed<bool>(() => super.playerTurn,
              name: '_GameStoreBase.playerTurn'))
          .value;
  Computed<Marker?>? _$winningPlayerComputed;

  @override
  Marker? get winningPlayer =>
      (_$winningPlayerComputed ??= Computed<Marker?>(() => super.winningPlayer,
              name: '_GameStoreBase.winningPlayer'))
          .value;
  Computed<Marker>? _$defenderComputed;

  @override
  Marker get defender =>
      (_$defenderComputed ??= Computed<Marker>(() => super.defender,
              name: '_GameStoreBase.defender'))
          .value;
  Computed<String>? _$actionTextComputed;

  @override
  String get actionText =>
      (_$actionTextComputed ??= Computed<String>(() => super.actionText,
              name: '_GameStoreBase.actionText'))
          .value;

  late final _$attackerAtom =
      Atom(name: '_GameStoreBase.attacker', context: context);

  @override
  Marker get attacker {
    _$attackerAtom.reportRead();
    return super.attacker;
  }

  @override
  set attacker(Marker value) {
    _$attackerAtom.reportWrite(value, super.attacker, () {
      super.attacker = value;
    });
  }

  late final _$winningCombinationAtom =
      Atom(name: '_GameStoreBase.winningCombination', context: context);

  @override
  List<int>? get winningCombination {
    _$winningCombinationAtom.reportRead();
    return super.winningCombination;
  }

  @override
  set winningCombination(List<int>? value) {
    _$winningCombinationAtom.reportWrite(value, super.winningCombination, () {
      super.winningCombination = value;
    });
  }

  late final _$playerMoveAtom =
      Atom(name: '_GameStoreBase.playerMove', context: context);

  @override
  int? get playerMove {
    _$playerMoveAtom.reportRead();
    return super.playerMove;
  }

  @override
  set playerMove(int? value) {
    _$playerMoveAtom.reportWrite(value, super.playerMove, () {
      super.playerMove = value;
    });
  }

  late final _$botMoveAtom =
      Atom(name: '_GameStoreBase.botMove', context: context);

  @override
  int? get botMove {
    _$botMoveAtom.reportRead();
    return super.botMove;
  }

  @override
  set botMove(int? value) {
    _$botMoveAtom.reportWrite(value, super.botMove, () {
      super.botMove = value;
    });
  }

  late final _$gameStateAtom =
      Atom(name: '_GameStoreBase.gameState', context: context);

  @override
  GameState get gameState {
    _$gameStateAtom.reportRead();
    return super.gameState;
  }

  @override
  set gameState(GameState value) {
    _$gameStateAtom.reportWrite(value, super.gameState, () {
      super.gameState = value;
    });
  }

  late final _$hoveredPosAtom =
      Atom(name: '_GameStoreBase.hoveredPos', context: context);

  @override
  int? get hoveredPos {
    _$hoveredPosAtom.reportRead();
    return super.hoveredPos;
  }

  @override
  set hoveredPos(int? value) {
    _$hoveredPosAtom.reportWrite(value, super.hoveredPos, () {
      super.hoveredPos = value;
    });
  }

  late final _$evaluationDelayAtom =
      Atom(name: '_GameStoreBase.evaluationDelay', context: context);

  @override
  Future<dynamic>? get evaluationDelay {
    _$evaluationDelayAtom.reportRead();
    return super.evaluationDelay;
  }

  @override
  set evaluationDelay(Future<dynamic>? value) {
    _$evaluationDelayAtom.reportWrite(value, super.evaluationDelay, () {
      super.evaluationDelay = value;
    });
  }

  late final _$onMarkerTappedAsyncAction =
      AsyncAction('_GameStoreBase.onMarkerTapped', context: context);

  @override
  Future onMarkerTapped(int pos) {
    return _$onMarkerTappedAsyncAction.run(() => super.onMarkerTapped(pos));
  }

  late final _$evaluateTurnAsyncAction =
      AsyncAction('_GameStoreBase.evaluateTurn', context: context);

  @override
  Future evaluateTurn() {
    return _$evaluateTurnAsyncAction.run(() => super.evaluateTurn());
  }

  late final _$_GameStoreBaseActionController =
      ActionController(name: '_GameStoreBase', context: context);

  @override
  dynamic onNewGamePressed() {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.onNewGamePressed');
    try {
      return super.onNewGamePressed();
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onHoverSquare(int pos) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.onHoverSquare');
    try {
      return super.onHoverSquare(pos);
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onUnhoverSquare(int pos) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.onUnhoverSquare');
    try {
      return super.onUnhoverSquare(pos);
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _switchTurn() {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase._switchTurn');
    try {
      return super._switchTurn();
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _checkPlayerWon() {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase._checkPlayerWon');
    try {
      return super._checkPlayerWon();
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
attacker: ${attacker},
winningCombination: ${winningCombination},
playerMove: ${playerMove},
botMove: ${botMove},
gameState: ${gameState},
hoveredPos: ${hoveredPos},
evaluationDelay: ${evaluationDelay},
playerTurn: ${playerTurn},
winningPlayer: ${winningPlayer},
defender: ${defender},
actionText: ${actionText}
    ''';
  }
}
