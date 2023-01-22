import 'package:flutter/material.dart';

class StatsOverview extends StatelessWidget {
  const StatsOverview({
    Key? key,
    required this.pairCount,
    required this.tryCount,
  }) : super(key: key);

  final int pairCount;
  final int tryCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Paare: $pairCount'),
            Text('Versuche: $tryCount'),
          ],
        ),
      ),
    );
  }
}
