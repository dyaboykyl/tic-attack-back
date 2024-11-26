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

  init() {
    onNewGamePressed();
  }

  @action
  onNewGamePressed() {
    markers.clear();
    for (var i = 0; i < 9; i++) {
      markers.add(Marker.EMPTY);
    }
  }

  @action
  onMarkerTapped(int pos) {
    print('$pos tapped');
    markers[pos] = Marker.X;
  }
}
