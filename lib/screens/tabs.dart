import 'package:calculs/model/boxes.dart';
import 'package:calculs/screens/add.dart';
import 'package:calculs/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _screens = [
    const AddScreen(),
    // SubtractScreen(),
    // MultiplyScreen(),
    // DivideScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: _screens.length,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: const [
            AddScreen(),
            // SubtractScreen(),
            // MultiplyScreen(),
            // DivideScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        currentIndex: _tabController.index,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSecondary.withOpacity(0.5),
        onTap: (index) {
          setState(() {
            _tabController.animateTo(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            _tabController.index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Additions",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.minimize_outlined),
          //   label: "Soustractions",
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.close),
          //   label: "Multiplications",
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.exposure),
          //   label: "Divisions",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
