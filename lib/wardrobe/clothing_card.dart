import 'package:flutter/material.dart';

class ClothingCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String status;

  const ClothingCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Set a fixed width for the card
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.4, // Set max height to 40% of the screen height
      ),
      child: Card(
        elevation: 2,
        child: Stack(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // Apply rounded corners
              child: AspectRatio(
                aspectRatio: 16 / 9, // Set aspect ratio to 16:9
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Cover the entire area while maintaining aspect ratio
                ),
              ),
            ),
            // Status tag
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: status == 'Available' ? Colors.green[100] : Colors.red[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: status == 'Available' ? Colors.green : Colors.red),
                ),
              ),
            ),
            // Title with contrasting text color
            Positioned(
              bottom: 4,
              left: 8,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54, // Use white or another contrasting color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 