import 'package:flutter/material.dart';
import 'package:memory_game/src/core/constants.dart';
import 'package:memory_game/src/core/widgets/memory_grid_tile.dart';
import 'package:memory_game/src/memory_play_area/widgets/stats_overview.dart';

class MemoryPlayArea extends StatefulWidget {
  const MemoryPlayArea({super.key, required this.numberOfCards});

  final int numberOfCards;

  static Route<void> route({required int numberOfCards}) {
    return MaterialPageRoute(
      builder: (context) => MemoryPlayArea(
        numberOfCards: numberOfCards,
      ),
    );
  }

  @override
  State<MemoryPlayArea> createState() => _MemoryPlayAreaState();
}

class _MemoryPlayAreaState extends State<MemoryPlayArea> {
  final List<int> correctPicks = [];
  final List<int> memoryCardIds = [];
  int pairCount = 0;
  int tryCount = 0;

  /// {tappedGridIndex : memoryCardId}
  Map<int, int>? firstPick;

  /// {tappedGridIndex : memoryCardId}
  Map<int, int>? secondPick;

  @override
  void initState() {
    super.initState();
    generateMemoryCardIds();
    memoryCardIds.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory'),
        leading: const BackButton(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          resetGame();
        },
        child: const Icon(Icons.refresh_outlined),
      ),
      body: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.numberOfCards,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              final bool tappedIndexEqualToGridIndex =
                  (firstPick?.keys.first == index ||
                      secondPick?.keys.first == index);

              if (tappedIndexEqualToGridIndex || correctPicks.contains(index)) {
                // Front
                return MemoryGridTile(
                  color: cardColors[memoryCardIds[index]],
                  child: memoryPictures[memoryCardIds[index]],
                );
              }
              // Back
              return MemoryGridTile(
                onTap: () {
                  clickHandler(index);
                },
                child: backsideImage,
              );
            },
          ),
          StatsOverview(pairCount: pairCount, tryCount: tryCount),
        ],
      ),
    );
  }

  void resetGame() {
    setState(() {
      tryCount = 0;
      pairCount = 0;
      firstPick = null;
      secondPick = null;
      correctPicks.clear();
      memoryCardIds.shuffle();
    });
  }

  void clickHandler(int index) {
    final bool winCondition = correctPicks.length == widget.numberOfCards;
    final bool firstPickSet = firstPick != null;
    final bool secondPickSet = secondPick != null;

    if (winCondition) return;

    if (!firstPickSet) {
      setFirstPick(index);
    } else if (!secondPickSet) {
      setSecondPick(index);
      checkGuess();
    }
  }

  void checkGuess() {
    final bool correctGuess =
        firstPick!.values.first == secondPick!.values.first;

    if (correctGuess) {
      correctPicks.add(firstPick!.keys.first);
      correctPicks.add(secondPick!.keys.first);
      pairCount++;
      resetPicksAfter(Duration.zero);
    } else {
      resetPicksAfter(const Duration(milliseconds: 500));
    }
    tryCount++;
  }

  void setFirstPick(int index) {
    setState(() {
      firstPick = {index: memoryCardIds[index]};
    });
  }

  void setSecondPick(int index) {
    setState(() {
      secondPick = {index: memoryCardIds[index]};
    });
  }

  void resetPicksAfter(Duration duration) {
    Future.delayed(duration, () {
      setState(() {
        firstPick = null;
        secondPick = null;
      });
    });
  }

  void generateMemoryCardIds() {
    for (int i = 0; i < widget.numberOfCards / 2; i++) {
      memoryCardIds.add(i);
      memoryCardIds.add(i);
    }
  }
}
