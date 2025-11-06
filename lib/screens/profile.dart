import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0XFF00A9E0),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // Android → สีขาว
          statusBarBrightness: Brightness.dark, // iOS → สีขาว
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // หัวข้อส่วนบัญชี
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10),
              child: const Text(
                'บัญชี',
                style: TextStyle(fontSize: 18, color: Color(0xFF7C7C7C)),
              ),
            ),

            // กล่องโปรไฟล์
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(50),
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'นายสมชาย ใจดี',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF00A9E0),
                        ),
                      ),
                      const Text(
                        'รหัสนักศึกษา : 65xxxxxxxx',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Text(
                        'สาขาวิทยาการคอมพิวเตอร์',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Text(
                        'คณะวิทยาศาสตร์และเทคโนโลยี',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 5,),
                      InkWell(
                        onTap: () {
                          // TODO: ใส่โค้ดออกจากระบบที่นี่ เช่น ลบ token หรือเปลี่ยนหน้า
                          print("ออกจากระบบ");
                          // ตัวอย่างเช่น กลับไปหน้า Login:
                          // Navigator.pushReplacementNamed(context, '/login');
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.logout, size: 14, color: Colors.red),
                              SizedBox(width: 4),
                              Text(
                                'ออกจากระบบ',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // กล่องซ้าย
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5), // เว้นขอบนิดนึง
                      padding: const EdgeInsets.all(10),
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0XFF00A9E0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "ตารางเรียน",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "ดูผลการเรียนของฉัน",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // กล่องขวา
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'A+',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Color(0XFF00A9E0),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "ตารางเรียน",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "ดูผลการเรียนของฉัน",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
