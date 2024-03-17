import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/info_page.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/settings_page.dart';

import 'widgets/build_app_bar.dart';
import 'widgets/main_page.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _pages = [
    "AlQuran App",
    "Settings",
    "Contact Us",
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: Drawer(
        backgroundColor: AppColors.background,
        child: ListView(
          children: _pages
              .map(
                (e) => ListTile(
                  title: Text(e, style: const TextStyle(color: Colors.white)),
                  onTap: () {
                    setState(() {
                      _index = _pages.indexWhere((element) => element == e);
                    });
                    Navigator.pop(context);
                  },
                ),
              )
              .toList(),
        ),
      ),
      appBar: BuildAppBar(),
      body: IndexedStack(
        index: _index,
        children: const [
          MainPage(),
          SettingsPage(),
          InfoPage(),
        ],
      ),
    );
  }
}



