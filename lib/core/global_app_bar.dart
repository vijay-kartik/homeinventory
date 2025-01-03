import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'global_app_menu.dart'; // Ensure this is the correct import

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(Widget) onTabSelected;

  const GlobalAppBar({Key? key, required this.onTabSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Set background color
      elevation: 1, // Add shadow
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                './app_logo.svg', // Your app logo
                height: 40,
              ),
              const SizedBox(width: 10), // Space between logo and title
              const Text(
                'HomeInventory',
                style: TextStyle(
                  color: Colors.black, // Title color
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          GlobalAppMenu(onTabSelected: onTabSelected), // Use the updated GlobalAppMenu
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('./profile.jpg'), // Update with your local image path
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.black), // Notification icon
          onPressed: () {
            // Handle notification action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // Height of the AppBar
} 