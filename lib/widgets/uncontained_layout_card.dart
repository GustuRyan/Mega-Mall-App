import 'package:flutter/material.dart';

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({super.key, required this.index, required this.label});

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8.0), // Beri margin antar item
      decoration: BoxDecoration(
        color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
        borderRadius: BorderRadius.circular(12), // Tambahkan border radius
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
    );
  }
}
