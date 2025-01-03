import 'package:flutter/material.dart';
import '../core/navigation_pane.dart';
import 'inventory_section.dart';
import 'outfits_section.dart';
import 'laundry_section.dart';

class WardrobeScreen extends StatefulWidget {
  const WardrobeScreen({Key? key}) : super(key: key);

  @override
  _WardrobeScreenState createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen> {
  String _currentSection = 'Inventory';
  int _selectedIndex = 0;

  void _onSectionSelected(String section) {
    setState(() {
      _currentSection = section;
      _selectedIndex = ['Inventory', 'Outfits', 'Laundry'].indexOf(section);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationPane(
          onSectionSelected: _onSectionSelected,
          sections: ['Inventory', 'Outfits', 'Laundry'],
          selectedIndex: _selectedIndex,
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: _buildContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    switch (_currentSection) {
      case 'Inventory':
        return const InventorySection();
      case 'Outfits':
        return const OutfitsSection();
      case 'Laundry':
        return const LaundrySection();
      default:
        return const InventorySection();
    }
  }
} 