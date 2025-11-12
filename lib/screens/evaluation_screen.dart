import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color primaryColor = Color(0xFF00A9E0);

class CourseEval {
  final String code;
  final String sec;
  final String name;
  final String credits;
  final String instructor;

  const CourseEval({
    required this.code,
    required this.sec,
    required this.name,
    required this.credits,
    required this.instructor,
  });
}

final List<CourseEval> _courses = [
  const CourseEval(
    code: 'DB66606', sec: '81', name: 'กฎหมาย จริยธรรมและความปลอดภัยทางธุรกิจดิจิทัล',
    credits: '3(2-2-5)', instructor: 'พนารัตน์',
  ),
  const CourseEval(
    code: 'AC66503', sec: '91', name: 'การเงินธุรกิจ',
    credits: '3(2-2-5)', instructor: 'นิตาการณ์',
  ),
  const CourseEval(
    code: 'BA66502', sec: '02', name: 'สถิติธุรกิจ',
    credits: '3(2-2-5)', instructor: 'อดิศักดิ์',
  ),
  const CourseEval(
    code: 'BE66501', sec: '91', name: 'ภาษาอังกฤษสำหรับธุรกิจ',
    credits: '3(2-2-5)', instructor: 'กานต์ณรงค์',
  ),
  const CourseEval(
    code: 'DB66609', sec: '91', name: 'การประชาสัมพันธ์ธุรกิจดิจิทัลด้วยสื่อดิจิทัล',
    credits: '3(2-2-5)', instructor: 'พนารัตน์',
  ),
  const CourseEval(
    code: 'DB66615', sec: '91', name: 'เทคโนโลยีสื่อเสมือนจริงสำหรับธุรกิจดิจิทัล',
    credits: '3(2-2-5)', instructor: 'เอกรวี',
  ),
];


class EvaluationPage extends StatefulWidget {
  const EvaluationPage({super.key});
  @override
  State<EvaluationPage> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  // State Variables
  String? _selectedYear1 = '1/2568';
  final List<String> _yearOptions1 = ['1/2568', '2/2567', '1/2567'];

  String? _selectedYear2 = '2568';
  final List<String> _yearOptions2 = ['2568', '2567', '2566'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: primaryColor,
        title: const Text(
          'แบบประเมิน',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // --- ส่วนที่ 1: ประเมินผู้สอน ---
          _buildSectionHeader("ประเมินผู้สอน"), // 🎨 ใช้ดีไซน์ใหม่
          _buildYearSelector(
            value: _selectedYear1,
            options: _yearOptions1,
            onChanged: (newValue) {
              setState(() {
                _selectedYear1 = newValue;
              });
            },
          ),
          const SizedBox(height: 8),
          ..._courses.map((course) => _buildCourseCard(course)).toList(),

          // --- ส่วนที่ 2: ประเมินมหาวิทยาลัย ---
          const Divider(height: 40, thickness: 1),
          ListTile(
            title: const Text(
              "ประเมินมหาวิทยาลัย",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.chevron_right, color: primaryColor),
            onTap: () { /* TODO: Handle tap */ },
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          const Divider(height: 40, thickness: 1),

          // --- ส่วนที่ 3: ประเมินสำหรับนักศึกษา ---
          _buildSectionHeader("ประเมินสำหรับนักศึกษา"), // 🎨 ใช้ดีไซน์ใหม่
          _buildYearSelector(
            value: _selectedYear2,
            options: _yearOptions2,
            onChanged: (newValue) {
              setState(() {
                _selectedYear2 = newValue;
              });
            },
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildSectionHeader(String title) {
    // 🎨 ดีไซน์หัวข้อแบบใหม่ที่อัปเดตแล้ว
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 28,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildYearSelector({
    required String? value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    return Row(
      children: [
        const Text("ปีการศึกษา :", style: TextStyle(fontSize: 16)),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCard(CourseEval course) {
    return Card(
      color: Colors.white, // เพิ่มสีขาวให้การ์ด
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.name,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.qr_code_scanner, "${course.code} | Sec: ${course.sec}"),
            _buildInfoRow(Icons.person_outline, "อาจารย์: ${course.instructor}"),
            _buildInfoRow(Icons.school_outlined, "หน่วยกิต: ${course.credits}"),
            const SizedBox(height: 8),
            const Divider(), // เพิ่มเส้นคั่นก่อนปุ่ม
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () { /* TODO: Handle tap */ },
                child: const Text(
                  'ประเมิน',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade600, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
            ),
          ),
        ],
      ),
    );
  }
}