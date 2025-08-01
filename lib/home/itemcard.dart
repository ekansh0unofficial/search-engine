import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.cost,
  });
  final String title;
  final String description;
  final double cost;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[300],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          Row(children: [Text(title), Text('$cost')]),
          Text(description),
        ],
      ),
    );
  }
}
