import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// --- โมเดลข้อมูล ---
class StudentGraduationInfo {
  final String studentId;
  final String fullName;
  final String major;
  final String faculty;
  final String status;
  final String graduationDate;

  StudentGraduationInfo({
    required this.studentId,
    required this.fullName,
    required this.major,
    required this.faculty,
    required this.status,
    required this.graduationDate,
  });
}

class GraduationPage extends StatefulWidget {
  const GraduationPage({super.key});

  @override
  State<GraduationPage> createState() => _GraduationPageState();
}

const Color primaryColor = Color(0xFF00A9E0);

class _GraduationPageState extends State<GraduationPage> {
  final StudentGraduationInfo _studentInfo = StudentGraduationInfo(
    studentId: "65xxxxxxxx",
    fullName: "นายสมชาย ใจดี",
    major: "วิทยาการคอมพิวเตอร์/65 ก.01",
    faculty: "วิทยาศาสตร์และเทคโนโลยี",
    status: "ปกติ",
    graduationDate: "",
  );

  Widget _buildInfoField(String label, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF4F4F4F),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  data.isEmpty ? Icons.info_outline : Icons.check_circle_outline,
                  color: data.isEmpty ? Colors.grey[400] : primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    data.isEmpty ? "-" : data,
                    style: TextStyle(
                      fontSize: 16,
                      color: data.isEmpty ? Colors.grey[500] : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F8FB),
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 3,
        shadowColor: Colors.black26,
        title: const Text(
          'ตรวจสอบการสำเร็จการศึกษา',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ส่วนหัว (Header Card)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                margin: const EdgeInsets.only(bottom: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
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
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _studentInfo.fullName,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "รหัสนักศึกษา ${_studentInfo.studentId}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ข้อมูลอื่นๆ
              _buildInfoField("สาขาวิชา :", _studentInfo.major),
              _buildInfoField("คณะ :", _studentInfo.faculty),
              _buildInfoField("สถานะปัจจุบัน :", _studentInfo.status),
              _buildInfoField("วันที่สำเร็จการศึกษา :", _studentInfo.graduationDate),

             
            ],
          ),
        ),
      ),
    );
  }
}
