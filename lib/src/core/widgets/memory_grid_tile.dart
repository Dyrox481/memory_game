import 'package:flutter/material.dart';

class MemoryGridTile extends StatelessWidget {
  const MemoryGridTile({
    super.key,
    this.color = Colors.grey,
    this.height = 100,
    this.width = 100,
    this.padding = 16.0,
    this.child,
    this.onTap,
  });

  final Color color;
  final double padding;
  final double height;
  final double width;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
