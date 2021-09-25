import 'package:flutter/material.dart';

class ButtonSelect extends StatelessWidget {
  const ButtonSelect({
    required this.text,
    required this.isSelected,
    required this.onPress,
  });

  final bool isSelected;
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(3, 20, 3, 20),
          decoration: BoxDecoration(
              color: isSelected ? Colors.red : Colors.red[100],
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
