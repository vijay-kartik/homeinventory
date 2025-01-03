import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LaundryStatusCard extends StatelessWidget {
  final String title;
  final int count;
  final String returnDate;
  final Color cardColor;
  final Color textColor;
  final String imagePath;

  const LaundryStatusCard({
    Key? key,
    required this.title,
    required this.count,
    required this.returnDate,
    required this.cardColor,
    required this.textColor,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  imagePath,
                  height: 24,
                ),
                Text(
                  '$count',
                  style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              returnDate,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
} 