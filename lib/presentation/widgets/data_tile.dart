import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  const DataTile({
    Key? key,
    required this.data,
    required this.title,
    this.color = Colors.blue,
    this.icon = Icons.coronavirus_outlined,
  }) : super(key: key);
  final int data;
  final String title;
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: color,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 50,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$data',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
