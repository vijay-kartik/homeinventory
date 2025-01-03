import 'package:flutter/material.dart';
import 'package:homeinventory/events/events_screen.dart';
import '../dashboard_screen.dart';
import '../finances/finance_screen.dart';
import '../wardrobe/wardrobe_screen.dart';
import 'tab_item.dart'; // Import the TabItem widget

class GlobalAppMenu extends StatelessWidget {
  final Function(Widget) onTabSelected;

  const GlobalAppMenu({Key? key, required this.onTabSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () => onTabSelected(const FinanceScreen()),
          child: const Text('Finances'),
        ),
        TextButton(
          onPressed: () => onTabSelected(const EventsScreen()),
          child: const Text('Events'),
        ),
        TextButton(
          onPressed: () => onTabSelected(const WardrobeScreen()),
          child: const Text('Wardrobe'),
        ),
      ],
    );
  }
} 