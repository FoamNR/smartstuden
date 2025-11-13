import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartpsru/screens/elective_booking.dart';
import 'package:smartpsru/screens/evaluation_screen.dart';
import 'package:smartpsru/screens/exam_schedule.dart';
import 'package:smartpsru/screens/grade_result_page.dart';
import 'package:smartpsru/screens/graduation.dart';
import 'package:smartpsru/screens/news.dart';
import 'package:smartpsru/screens/offered_courses.dart';
import 'package:smartpsru/screens/payment_page.dart';
import 'package:smartpsru/screens/plan.dart';
import 'package:smartpsru/screens/profile.dart';
import 'package:smartpsru/screens/register_course_page.dart';
import 'package:smartpsru/screens/timetable.dart';
//import 'package:smartpsru/screens/news.dart';
//import 'package:smartpsru/widgets/navbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // ให้พื้นหลังโปร่งใส
        statusBarIconBrightness: Brightness.light, // Android → ไอคอนสีขาว
        statusBarBrightness: Brightness.dark, // iOS → ไอคอนสีขาว
      ),
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF00A9E0), Color(0xFF9AD6F0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'ระบบบริการนักศึกษา',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Student Smart University',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -45,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Image.asset('assets/images/logo2.png', height: 70),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.symmetric(
                        vertical: 22.0,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                "รหัสนักศึกษา",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                "65xxxxxxxx",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "ภาคเรียน",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                "1/2568",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00A9E0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "เมนูหลัก",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      150, // ความกว้างสูงสุดต่อช่อง (จะปรับคอลัมน์อัตโนมัติ)
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  //childAspectRatio: 1, // อัตราส่วนกว้าง/สูง
                                ),
                            children: [
                              _buildMenuItem(
                                icon: Icons.person,
                                "ข้อมูลส่วนตัว",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProfilePage(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                icon: Icons.newspaper,
                                "ข่าวสาร",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => NewsPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                icon: Icons.attach_money,
                                "การชำระเงิน",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PaymentPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                icon: Icons.menu_book,
                                "แผนการเรียน",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PlanPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                icon: Icons.calendar_month,
                                "ตารางเรียน",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TimeTablePage(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                icon: Icons.date_range,
                                "ตารางสอบ",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ExamSchedulePage(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                icon: Icons.edit_document,
                                "ลงทะเบียนเรียน",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => RegisterPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                icon: Icons.playlist_add,
                                "จองวิชาเสรี",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BookingElective(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                icon: Icons.list_alt,
                                "รายวิชาที่เปิดสอน",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => OfferedCoursesPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                boxText: "A+",
                                "ผลการเรียน",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => GradeResultPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                icon: Icons.school,
                                "สำเร็จการศึกษา",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => GraduationPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildMenuItem(
                                icon: Icons.edit_calendar_rounded,
                                "การประเมิน",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => EvaluationPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    String title, {
    IconData? icon,
    String? boxText, // เพิ่มตัวแปรสำหรับรับ Text
    VoidCallback? onTap,
  }) {
    // ตรวจสอบว่าต้องมี icon หรือ boxText อย่างใดอย่างหนึ่งเท่านั้น
    assert(
      icon != null || boxText != null,
      'Must provide either an icon or boxText',
    );
    assert(
      icon == null || boxText == null,
      'Cannot provide both an icon and boxText',
    );

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap:
          onTap ??
          () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('คุณกดเมนู: $title')));
          },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60, // อาจจะกำหนดขนาดให้คงที่
            height: 60, // เพื่อให้กล่องเท่ากัน
            padding: const EdgeInsets.all(8), // ปรับ padding ให้พอดี
            decoration: BoxDecoration(
              color: const Color(0xFF6EC6FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: icon != null
                ? Icon(icon, color: Colors.white, size: 30)
                : Text(
                    boxText!, // ใส่ ! เพราะเรา assert แล้วว่าต้องมีค่า
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30, // ปรับขนาดตามความเหมาะสม
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
            // --- จบส่วนที่แก้ไข ---
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
