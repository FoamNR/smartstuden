import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF00A9E0),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'ผลการเรียน'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'แจ้งเตือน'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'โปรไฟล์'),
      ],
    );
  }
}
