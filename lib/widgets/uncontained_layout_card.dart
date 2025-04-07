import 'package:flutter/material.dart';

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.label,
    required this.width,
  });

  final int index;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 27.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(label),
          fit: BoxFit.cover,
        ),
        color: Colors.primaries[index % Colors.primaries.length].withOpacity(
          0.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
