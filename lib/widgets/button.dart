import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    Key? key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.text,
  }) : super(key: key);
  final double height;
  final double width;
  final String text;
  final VoidCallback onTap;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color myColor = const Color(0xFF2E3B62);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(color: myColor),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
          ),
        ),
      ),
    );
  }
}
