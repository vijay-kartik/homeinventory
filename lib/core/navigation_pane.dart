import 'package:flutter/material.dart';

class NavigationPane extends StatelessWidget {
  final Function(String) onSectionSelected;
  final List<String> sections;
  final int selectedIndex;

  const NavigationPane({
    Key? key,
    required this.onSectionSelected,
    required this.sections,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue[50], // Background color for the navigation pane
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Wardrobe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ...List.generate(sections.length, (index) {
            return ListTile(
              title: Text(sections[index]),
              selected: selectedIndex == index,
              onTap: () => onSectionSelected(sections[index]),
            );
          }),
        ],
      ),
    );
  }
} 