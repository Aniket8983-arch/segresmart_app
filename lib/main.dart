import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/waste_provider.dart';
import 'screens/home_screen.dart';
import 'screens/rewards_screen.dart';
import 'screens/notifications_screen.dart';

void main() {
  runApp(const SegreSmartApp());
}

class SegreSmartApp extends StatelessWidget {
  const SegreSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // load data and start auto-refresh simulation
      create: (_) => WasteProvider()..loadInitialData()..autoRefresh(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SegreSmart',
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        home: const MainNavigation(),
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    RewardsScreen(),
    NotificationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Rewards'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
        ],
      ),
    );
  }
}
