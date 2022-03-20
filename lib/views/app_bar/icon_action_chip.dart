import 'package:flutter/material.dart';

class IconActionChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconActionChip({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ActionChip(
          backgroundColor: Color.fromARGB(200, 42, 62, 73),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.grey.shade500,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                text,
                style: TextStyle(color: Colors.grey.shade300),
              )
            ],
          ),
          onPressed: () => print(text)),
    );
  }
}
