import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tic_attack_back/game_store.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final store = GameStore();

  double get width {
    final size = MediaQuery.of(context).size;
    return min(size.width, size.height) * .8;
  }

  double get height => width;
  final double boardDivision = 25;
  double get squareWidth => width * ((boardDivision - 2) / 3) / boardDivision;
  double get lineWidth => width / boardDivision;

  @override
  void initState() {
    super.initState();
    store.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x0000c1ac),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // const SizedBox(height: 20),
              board(),
              const SizedBox(height: 20),
              newGameButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget board() {
    return SizedBox(
        width: width,
        child: Stack(
          children: [
            lines(),
            Transform.rotate(
              angle: pi / 2,
              child: lines(),
            ),
            markerSquares(),
          ],
        ));
  }

  Widget lines() {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          line(),
          line(),
        ],
      ),
    );
  }

  Widget line() {
    return Container(
      decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.circular(25)),
      height: height,
      width: lineWidth,
    );
  }

  Widget markerSquares() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: lineWidth,
      crossAxisSpacing: lineWidth,
      children: List.generate(9, (i) => markerSquare(i)),
    );
  }

  Widget markerSquare(pos) {
    return GestureDetector(
      onTap: () => store.onMarkerTapped(pos),
      child: Container(
        color: Colors.transparent,
        width: squareWidth,
        child:
            Observer(builder: (context) => marker(store.markers[pos], store.getMarkerColor(pos))),
      ),
    );
  }

  Widget marker(Marker marker, Color color) {
    return Center(
      child: Text(
        marker.getText(),
        style: TextStyle(fontSize: squareWidth, height: 1, color: color),
      ),
    );
  }

  Widget newGameButton() {
    return ElevatedButton(onPressed: store.onNewGamePressed, child: const Text('New Game'));
  }
}
