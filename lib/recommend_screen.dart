import 'package:flutter/material.dart';
import 'dart:math';

class NetworkUI extends StatefulWidget {
  const NetworkUI({super.key});

  @override
  State<NetworkUI> createState() => _NetworkUIState();
}

class _NetworkUIState extends State<NetworkUI> {
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(
              painter: NetworkPainter(),
              child: Container(),
            ),
            ...buildNodes(),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 14),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: Colors.white,
                    ),
                    child: Slider(
                      value: _sliderValue,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Point of View',
                            style: TextStyle(color: Colors.white)),
                        Text('Princess', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildNodes() {
    final nodes = [
      NodeData(x: 0.5, y: 0.5, color: Colors.red, icon: Icons.favorite),
      NodeData(x: 0.3, y: 0.3, color: Colors.green, icon: Icons.eco),
      NodeData(x: 0.7, y: 0.3, color: Colors.blue, icon: Icons.water),
      NodeData(x: 0.2, y: 0.7, color: Colors.orange, icon: Icons.sunny),
      NodeData(x: 0.8, y: 0.7, color: Colors.purple, icon: Icons.music_note),
    ];

    return nodes
        .map((node) => Positioned(
              left: node.x * MediaQuery.of(context).size.width,
              top: node.y * MediaQuery.of(context).size.height,
              child: GestureDetector(
                onTap: () {
                  // Handle node tap
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: node.color,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(node.icon, color: Colors.white),
                ),
              ),
            ))
        .toList();
  }
}

class NodeData {
  final double x;
  final double y;
  final Color color;
  final IconData icon;

  NodeData(
      {required this.x,
      required this.y,
      required this.color,
      required this.icon});
}

class NetworkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) * 0.4;

    for (var i = 0; i < 5; i++) {
      final angle = 2 * pi * i / 5;
      final offset = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      canvas.drawLine(center, offset, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
