import 'package:flutter/material.dart';
import 'finances/finance_screen.dart';
import 'injection_container.dart';
import 'theme.dart';
import 'core/global_app_bar.dart';

void main() {
  setup(); // Initialize GetIt
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Inventory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
          surface: AppColors.backgroundColor,
        ),
        textTheme: const TextTheme(
          headlineLarge: AppTypography.headline1,
          bodyMedium: AppTypography.bodyText1,
          labelMedium: AppTypography.buttonText,
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const MyHomePage(title: 'Home Inventory'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _currentScreen = const FinanceScreen(); // Changed from DashboardScreen

  void _onTabSelected(Widget screen) {
    setState(() {
      _currentScreen = screen; // Update the current screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(onTabSelected: _onTabSelected),
      body: Column(
        children: [
          const Divider(height: 1, thickness: 1, color: Colors.grey), // Permanent horizontal divider
          Expanded(child: _currentScreen), // Display the current screen
        ],
      ),
    );
  }
}
