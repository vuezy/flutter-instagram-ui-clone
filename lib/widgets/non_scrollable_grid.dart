import 'package:flutter/material.dart';

class NonScrollableGrid extends StatelessWidget {
  const NonScrollableGrid({
    super.key,
    required this.itemPerRow,
    required this.gap,
    required this.children
  });

  final int itemPerRow;
  final double gap;
  final List<Widget> children;

  List<Widget> _createGrid() {
    final List<Widget> columnChildren = [];
    List<Widget> rowChildren = [];
    for (int itemIndex = 0; itemIndex < children.length; itemIndex++) {
      if (itemIndex >= itemPerRow) {
        rowChildren.add(
          Expanded(
            child: Column(
              children: [
                SizedBox(height: gap),
                children[itemIndex],
              ],
            )
          )
        );
      }
      else {
        rowChildren.add(Expanded(child: children[itemIndex]));
      }
      
      if ((itemIndex + 1) % itemPerRow == 0) {
        columnChildren.add(Row(children: rowChildren));
        rowChildren = <Widget>[];
      }
      else if (itemIndex == children.length - 1) {
        // Excluding SizedBox between Expanded
        int gapCount = itemIndex % itemPerRow;
        while ((rowChildren.length - gapCount) % itemPerRow != 0) {
          rowChildren.add(SizedBox(width: gap));
          gapCount++;
          rowChildren.add(
            Expanded(
              child: Container(
                height: 110.0,
                color: Colors.transparent
              )
            )
          );
        }
        columnChildren.add(Row(children: rowChildren));
      }
      else {
        rowChildren.add(SizedBox(width: gap));
      }
    }
    return columnChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _createGrid()
    );
  }
}