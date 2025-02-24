import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String title;
  final Widget? child;

  const ListCard({required this.title, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      children: [
        Text(title),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
