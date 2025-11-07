import 'package:flutter/material.dart';
import 'package:smartpsru/screens/home.dart';
import 'package:smartpsru/screens/mainpage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 🔹 พื้นหลังครึ่งบนสีฟ้า
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            color: const Color(0xFF00A5DF),
          ),

          // 🔹 เนื้อหาหลัก (Card + ข้อความด้านล่าง)
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // กล่องสีขาว (Card)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 40,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 246, 246),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // โลโก้
                        Image.asset('assets/images/logo2.png', width: 180),
                        const SizedBox(height: 30),

                        // ช่องรหัสนักศึกษา
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: userController,
                            decoration: InputDecoration(
                              hintText: 'รหัสนักศึกษา',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                              ),
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: const Icon(
                                  Icons.person_outline,
                                  color: Color(0xFF2E7DCA),
                                  size: 22,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 20,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: passController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'รหัสผ่าน',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                              ),
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF2E7DCA),
                                  size: 22,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 20,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // ปุ่มเข้าสู่ระบบ
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00A5DF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeMainPage(),
                                ),
                                (Route<dynamic> route) =>
                                    false, // This predicate makes sure all previous routes are removed
                              );
                              print("รหัสนักศึกษา: ${userController.text}");
                              print("รหัสผ่าน: ${passController.text}");
                            },
                            child: const Text(
                              'เข้าสู่ระบบ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // ลืมรหัสผ่าน
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "ฟังก์ชันลืมรหัสผ่านกำลังพัฒนา...",
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'ลืมรหัสผ่าน?',
                            style: TextStyle(
                              color: Color(0xFF2E7DCA),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // 🔹 ข้อความอยู่นอก card
                  const Text(
                    'รหัสผ่านเริ่มต้นใช้ วันเดือนปีเกิด เช่น 05042535\n(วันที่ 5 เม.ย. 2535)',
                    style: TextStyle(color: Color(0xFF6C8EBF), fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
