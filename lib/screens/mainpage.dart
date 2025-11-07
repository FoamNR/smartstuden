import 'package:flutter/material.dart';
import 'package:smartpsru/screens/building.dart';
import 'package:smartpsru/screens/home.dart';
import 'package:smartpsru/screens/news.dart';
import 'package:smartpsru/screens/profile.dart';
import 'package:smartpsru/screens/timetable.dart';
import 'package:smartpsru/widgets/navbar_widget.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  int _currentIndex = 0;

  // ✅ กำหนดหน้าที่จะใช้สลับ
  final List<Widget> _pages = const [
    HomePage(), // หน้าแรก
    NewsPage(),
    BuildingPage(),
    TimeTablePage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ แสดงหน้าเปลี่ยนตาม nav index
      body: _pages[_currentIndex],

      bottomNavigationBar: MyNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
