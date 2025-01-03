import 'package:flutter/material.dart';
import 'laundry_status_card.dart'; // Import the LaundryStatusCard widget

class LaundrySection extends StatelessWidget {
  const LaundrySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Current Laundry Status',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildLaundryStatus(),
        const SizedBox(height: 20),
        const Text(
          'New Laundry List',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildNewLaundryList(),
      ],
    );
  }

  Widget _buildLaundryStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: LaundryStatusCard(
            title: 'Items in Laundry',
            count: 12,
            returnDate: 'Return Date: March 15, 2025',
            cardColor: Colors.lightBlue[100]!,
            textColor: Colors.blue,
            imagePath: 'cloth.svg',
          ),
        ),
        const SizedBox(width: 10), // Space between cards
        Expanded(
          child: LaundryStatusCard(
            title: 'Dry Cleaning',
            count: 5,
            returnDate: 'Return Date: March 16, 2025',
            cardColor: Colors.purple[100]!,
            textColor: Colors.purple,
            imagePath: 'dry_clean.svg',
          ),
        ),
        const SizedBox(width: 10), // Space between cards
        Expanded(
          child: LaundryStatusCard(
            title: 'Completed',
            count: 8,
            returnDate: 'Ready for Pickup',
            cardColor: Colors.green[100]!,
            textColor: Colors.green,
            imagePath: 'completed.svg',
          ),
        ),
      ],
    );
  }

  Widget _buildNewLaundryList() {
    return Column(
      children: [
        const Text('Machine Wash', style: TextStyle(fontSize: 18)),
        _buildLaundryCheckbox('T-Shirts (5)'),
        _buildLaundryCheckbox('Pants (3)'),
        _buildLaundryCheckbox('Socks (8 pairs)'),
        const SizedBox(height: 20),
        const Text('Dry Clean', style: TextStyle(fontSize: 18)),
        _buildLaundryCheckbox('Suits (2)'),
        _buildLaundryCheckbox('Dresses (1)'),
        _buildLaundryCheckbox('Coats (1)'),
        const SizedBox(height: 20),
        const Text('Delicate Wash', style: TextStyle(fontSize: 18)),
        _buildLaundryCheckbox('Sweaters (2)'),
        _buildLaundryCheckbox('Silk Shirts (3)'),
        _buildLaundryCheckbox('Scarves (2)'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle generate list action
          },
          child: const Text('Generate List'),
        ),
      ],
    );
  }

  Widget _buildLaundryCheckbox(String title) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        Text(title),
      ],
    );
  }
} 