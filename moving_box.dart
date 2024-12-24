import 'package:flutter/material.dart';

class MovingBox extends StatefulWidget {
  const MovingBox({Key? key}) : super(key: key);

  @override
  State<MovingBox> createState() => _MovingBoxState();
}

class _MovingBoxState extends State<MovingBox> {
  double _leftPosition = 50; // Posisi awal kotak

  void _moveBox() {
    setState(() {
      // Pindahkan kotak ke posisi baru
      _leftPosition = _leftPosition == 50 ? 200 : 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moving Box Animation'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            left: _leftPosition,
            top: 100,
            child: GestureDetector(
              onTap: _moveBox,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _moveBox,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
