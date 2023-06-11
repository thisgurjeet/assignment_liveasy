import 'package:flutter/material.dart';

class BoxContainer extends StatefulWidget {
  final IconData icon;
  final String text;

  const BoxContainer({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  _BoxContainerState createState() => _BoxContainerState();
}

class _BoxContainerState extends State<BoxContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 95,
        width: 365,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                        width: 2.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSelected,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Icon(
                widget.icon,
                size: 50,
                color: const Color.fromARGB(255, 48, 48, 48),
                weight: 0.1,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text,
                    style: const TextStyle(fontSize: 19),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text('Lorem lpsum dolor sit amet,'),
                  const Text('consectetur adipiscing')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
