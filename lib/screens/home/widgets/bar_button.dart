import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  const BarButton({this.boxDecoration, this.label, this.onPressed});

  final BoxDecoration boxDecoration;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 150,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: boxDecoration,
        child: Text(
          label,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
