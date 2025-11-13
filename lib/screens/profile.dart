import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartpsru/screens/grade_result_page.dart';
import 'package:smartpsru/screens/login.dart';
import 'package:smartpsru/screens/timetable.dart';

// 1. Model Class สำหรับข้อมูลนักศึกษา (Student Data Model)
class Student {
  final String fullName;
  final String studentId;
  final String major;
  final String faculty;
  final String year;
  final String email;
  final String phone;
  final String profileImagePath;

  Student({
    required this.fullName,
    required this.studentId,
    required this.major,
    required this.faculty,
    required this.year,
    required this.email,
    required this.phone,
    required this.profileImagePath,
  });
}

// หน้า Profile หลัก
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // 2. Mock Data: สร้าง Object ของ Student
  final Student _mockStudent = Student(
    fullName: 'นายสมชาย ใจดี',
    studentId: '65xxxxxxxx',
    major: 'วิทยาการคอมพิวเตอร์',
    faculty: 'คณะวิทยาศาสตร์และเทคโนโลยี',
    year: '4',
    email: 'somchai@email.psru.ac.th',
    phone: '098-xxx-xxxx',
    profileImagePath: 'assets/images/profile.png', // รูปภาพโปรไฟล์
  );

  // Widget สำหรับแสดงแถวข้อมูล
  Widget _buildInfoRow(IconData icon, String label, String value) {
    
    return Row(
      children: [
        Icon(
          icon,
          color: Color(0XFF00A9E0),
          size: 24,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0XFF00A9E0),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
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
            // กล่องโปรไฟล์ - ใช้ Mock Data
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
                        _mockStudent.profileImagePath, // ใช้ Mock Data
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _mockStudent.fullName, // ใช้ Mock Data
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF00A9E0),
                        ),
                      ),
                      Text(
                        'รหัสนักศึกษา : ${_mockStudent.studentId}', // ใช้ Mock Data
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        _mockStudent.major, // ใช้ Mock Data
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        _mockStudent.faculty, // ใช้ Mock Data
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
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
            // กล่องเมนู 2 อัน (ส่วนนี้ไม่มีข้อมูลนักศึกษามาเกี่ยวข้องโดยตรง)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // กล่องซ้าย - ตารางเรียน
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TimeTablePage(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
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
                                "ดูตารางเรียนของฉัน",
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
                  ),
                  // กล่องขวา - ผลการเรียน
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GradeResultPage(),
                          ),
                        );
                      },
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
                                "ผลการเรียน",
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
                  ),
                ],
              ),
            ),
            // หัวข้อข้อมูลนักศึกษา
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10),
              child: const Text(
                'ข้อมูลนักศึกษา',
                style: TextStyle(fontSize: 18, color: Color(0xFF7C7C7C)),
              ),
            ),
            // กล่องข้อมูลนักศึกษา - ใช้ Mock Data
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(15),
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
              child: Column(
                children: [
                  _buildInfoRow(Icons.person, 'ชื่อ-นามสกุล', _mockStudent.fullName), // ใช้ Mock Data
                  const Divider(height: 20),
                  _buildInfoRow(Icons.badge, 'รหัสนักศึกษา', _mockStudent.studentId), // ใช้ Mock Data
                  const Divider(height: 20),
                  _buildInfoRow(Icons.school, 'สาขาวิชา', _mockStudent.major), // ใช้ Mock Data
                  const Divider(height: 20),
                  _buildInfoRow(Icons.business, 'คณะ', _mockStudent.faculty), // ใช้ Mock Data
                  const Divider(height: 20),
                  _buildInfoRow(Icons.calendar_today, 'ชั้นปี', _mockStudent.year), // ใช้ Mock Data
                  const Divider(height: 20),
                  _buildInfoRow(Icons.email, 'อีเมล', _mockStudent.email), // ใช้ Mock Data
                  const Divider(height: 20),
                  _buildInfoRow(Icons.phone, 'เบอร์โทร', _mockStudent.phone), // ใช้ Mock Data
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}