import 'package:flutter/material.dart';

class DigitButton extends StatelessWidget {
  const DigitButton({
    super.key,
    required this.caracter,
    required this.onPressed,
    required this.color,
  });
  final String caracter;
  final void Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black12,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: onPressed,
          child: Text(
            caracter,
            style: TextStyle(color: color, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
