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
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
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
                  child: const Center(
                    child: Text(
                      'ระบบบริการนักศึกษา',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Text(
                        "ประกาศ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 140,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        padding: const EdgeInsets.only(left: 20, right: 5),
                        child: Row(
                          children: [
                            _buildAnnouncementCard(
                              imageAsset: 'assets/images/homenews1.jpg',
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('ไปหน้าลงทะเบียนรถ'),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 15),
                            _buildAnnouncementCard(
                              imageAsset: 'assets/images/homenews2.jpg',
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('ไปหน้าแจ้งปัญหาเน็ต'),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // <--- แก้ไขจุดที่ 1
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            children: [
                              _buildMenuItem(
                                "ข้อมูลส่วนตัว",
                                icon: Icons.person,
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
                                "ข่าวสาร",
                                icon: Icons.newspaper,
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
                                "การชำระเงิน",
                                icon: Icons.attach_money,
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
                                "แผนการเรียน",
                                icon: Icons.menu_book,
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
                                "ตารางเรียน",
                                icon: Icons.calendar_month,
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
                                "ตารางสอบ",
                                icon: Icons.date_range,
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
                                "ลงทะเบียนเรียน",
                                icon: Icons.edit_document,
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
                                "จองวิชาเสรี",
                                icon: Icons.playlist_add,
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
                                "รายวิชาที่เปิดสอน",
                                icon: Icons.list_alt,
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
                                "ผลการเรียน",
                                boxText: "A+",
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
                                "สำเร็จการศึกษา",
                                icon: Icons.school,
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
                                "การประเมิน",
                                icon: Icons.edit_calendar_rounded,
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

  Widget _buildAnnouncementCard({
    required String imageAsset,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 240,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'โหลดรูปไม่สำเร็จ',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      imageAsset.split('/').last,
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    String title, {
    IconData? icon,
    String? boxText,
    VoidCallback? onTap,
  }) {
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
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF6EC6FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: icon != null
                ? Icon(icon, color: Colors.white, size: 30)
                : Text(
                    boxText!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            maxLines: 1, // <--- แก้ไขจุดที่ 2
            overflow: TextOverflow.ellipsis, // <--- แก้ไขจุดที่ 2
          ),
        ],
      ),
    );
  }
}