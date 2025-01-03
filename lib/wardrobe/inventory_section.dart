import 'package:flutter/material.dart';
import 'clothing_card.dart'; // Import the ClothingCard widget

class InventorySection extends StatelessWidget {
  const InventorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar for filters
          _buildSidebar(),
          const VerticalDivider(width: 1, color: Colors.grey), // Divider between sidebar and grid
          // Grid for clothing items
          Expanded(
            child: _buildClothingGrid(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add item action
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue[50], // Background color for the sidebar
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filters', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text('Category', style: TextStyle(fontSize: 16)),
          CheckboxListTile(
            title: const Text('Tops'),
            value: false,
            onChanged: (value) {},
          ),
          CheckboxListTile(
            title: const Text('Bottoms'),
            value: false,
            onChanged: (value) {},
          ),
          CheckboxListTile(
            title: const Text('Dresses'),
            value: false,
            onChanged: (value) {},
          ),
          CheckboxListTile(
            title: const Text('Outerwear'),
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          const Text('Color', style: TextStyle(fontSize: 16)),
          // Add color filter options here
          const SizedBox(height: 20),
          const Text('Season', style: TextStyle(fontSize: 16)),
          // Add season filter options here
          const SizedBox(height: 20),
          const Text('Status', style: TextStyle(fontSize: 16)),
          // Add status filter options here
        ],
      ),
    );
  }

  Widget _buildClothingGrid() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 5, // Set to 5 columns for 5 items in a row
        childAspectRatio: 1.5, // Aspect ratio for the cards
        children: List.generate(6, (index) {
          return ClothingCard(
            title: 'Clothing Item ${index + 1}',
            imagePath: 'shirt.png', // Updated image path
            status: 'Available', // Status indicator
          );
        }),
      ),
    );
  }
} 