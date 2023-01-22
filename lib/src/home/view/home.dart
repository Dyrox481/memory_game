import 'package:flutter/material.dart';
import 'package:memory_game/src/core/constants.dart';
import 'package:memory_game/src/core/widgets/memory_grid_tile.dart';
import 'package:memory_game/src/memory_play_area/view/memory_play_area.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const Text('Wähle die Anzahl der Karten'),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              for (final playAreaSize in playAreaSizes)
                MemoryGridTile(
                  padding: 32,
                  onTap: () => Navigator.of(context).push(
                    MemoryPlayArea.route(numberOfCards: playAreaSize),
                  ),
                  child: Text(playAreaSize.toString()),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
