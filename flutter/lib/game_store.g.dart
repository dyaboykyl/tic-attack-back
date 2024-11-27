// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameStore on _GameStoreBase, Store {
  Computed<Marker?>? _$winningPlayerComputed;

  @override
  Marker? get winningPlayer =>
      (_$winningPlayerComputed ??= Computed<Marker?>(() => super.winningPlayer,
              name: '_GameStoreBase.winningPlayer'))
          .value;

  late final _$currentPlayerAtom =
      Atom(name: '_GameStoreBase.currentPlayer', context: context);

  @override
  Marker get currentPlayer {
    _$currentPlayerAtom.reportRead();
    return super.currentPlayer;
  }

  @override
  set currentPlayer(Marker value) {
    _$currentPlayerAtom.reportWrite(value, super.currentPlayer, () {
      super.currentPlayer = value;
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
  dynamic onMarkerTapped(int pos) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.onMarkerTapped');
    try {
      return super.onMarkerTapped(pos);
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPlayer: ${currentPlayer},
winningCombination: ${winningCombination},
winningPlayer: ${winningPlayer}
    ''';
  }
}
