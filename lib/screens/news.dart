import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(13),
              child: const Text(
                'ข่าวสาร',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(13),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // รูปภาพข่าว
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/news1.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // หัวข้อข่าว
                  const Text(
                    'เปิดระบบรับสมัครออนไลน์ – นักศึกษาใหม่ ระดับปริญญาตรี และระดับปริญญาตรี (เทียบโอน, ต่อเนื่อง) ภาคปกติ ประจำปีการศึกษา 2569',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // เส้นแบ่ง
                  const Divider(
                    color: Colors.black12,
                    thickness: 1,
                    height: 20,
                  ),

                  // วันที่ + อ่านเพิ่มเติม
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '28/10/2025',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: ไปหน้าแสดงรายละเอียดข่าว
                        },
                        child: const Text(
                          'อ่านเพิ่มเติม',
                          style: TextStyle(
                            color: Color(0XFF00A9E0),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(13),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // รูปภาพข่าว
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/news1.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // หัวข้อข่าว
                  const Text(
                    'เปิดระบบรับสมัครออนไลน์ – นักศึกษาใหม่ ระดับปริญญาตรี และระดับปริญญาตรี (เทียบโอน, ต่อเนื่อง) ภาคปกติ ประจำปีการศึกษา 2569',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // เส้นแบ่ง
                  const Divider(
                    color: Colors.black12,
                    thickness: 1,
                    height: 20,
                  ),

                  // วันที่ + อ่านเพิ่มเติม
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '28/10/2025',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: ไปหน้าแสดงรายละเอียดข่าว
                        },
                        child: const Text(
                          'อ่านเพิ่มเติม',
                          style: TextStyle(
                            color: Color(0XFF00A9E0),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
