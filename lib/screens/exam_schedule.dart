import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 1. เปลี่ยนชื่อคลาสเป็น ExamSchedulePage
class ExamSchedulePage extends StatefulWidget {
  const ExamSchedulePage({super.key});

  @override
  State<ExamSchedulePage> createState() => _ExamSchedulePageState();
}

class _ExamSchedulePageState extends State<ExamSchedulePage> {
  String? selectedYear = '2/2567';
  final List<String> years = ['1/2567', '2/2567', '1/2568', '2/2568'];

  // 2. ปรับ Card ให้เป็น "การ์ดสอบ" (buildExamCard)
  //    - เพิ่ม "date"
  //    - ตัด "teacher" และ "period" ออก
  //    - เปลี่ยน "ห้องเรียน" เป็น "ห้องสอบ"
  Widget buildExamCard({
    required String subjectName,
    required String code,
    required String date,
    required String time,
    required String room,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // วันที่และเวลา
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'วันที่ : $date', // แสดงวันที่สอบ
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.black54),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            subjectName,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF004D92),
            ),
          ),
          const SizedBox(height: 6),
          Text('รหัสวิชา : $code', style: const TextStyle(color: Colors.black87)),
          Text('ห้องสอบ : $room', style: const TextStyle(color: Colors.black87)), // เปลี่ยนเป็น "ห้องสอบ"
        ],
      ),
    );
  }

  // 3. ปรับ Section ให้จัดกลุ่มตาม "วันที่" (buildDateSection)
  Widget buildDateSection(String date, List<Widget> exams) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date, // หัวข้อเป็นวันที่ เช่น "20 ต.ค. 2568"
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E2E2E),
            ),
          ),
          const SizedBox(height: 8),
          exams.isNotEmpty
              ? Column(children: exams)
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // 4. เปลี่ยนข้อความเมื่อไม่มีสอบ
                  child: const Text('ไม่พบรายการสอบในวันนี้',
                      style: TextStyle(color: Colors.black54)),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF00A9E0),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        // 1. เปลี่ยนหัวข้อเป็น "ตารางสอบ"
        title: const Text('ตารางสอบ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ส่วนหัวนักศึกษา + dropdown (ยังคงเดิม)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'นายสมชาย ใจดี',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('สาขา วิทยาการคอมพิวเตอร์',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedYear,
                      items: years.map((String year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Text(year),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() => selectedYear = newValue);
                        // ที่จริงตรงนี้ต้องมีการ fetch ข้อมูลสอบใหม่
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 5. สร้างข้อมูล Mockup ตารางสอบใหม่
            buildDateSection('วันจันทร์ที่ 20 ตุลาคม 2568', [
              buildExamCard(
                subjectName: 'วิชาระบบฐานข้อมูล',
                code: '5792502',
                date: '20 ต.ค. 2568',
                time: '13.00 - 16.00',
                room: '1356',
              ),
            ]),
            buildDateSection('วันอังคารที่ 21 ตุลาคม 2568', []), // วันที่ไม่มีสอบ
            buildDateSection('วันพุธที่ 22 ตุลาคม 2568', [
              buildExamCard(
                subjectName: 'วิชาวงจรดิจิทัล',
                code: '5791302',
                date: '22 ต.ค. 2568',
                time: '9.00 - 12.00',
                room: '1353',
              ),
              buildExamCard(
                subjectName: 'วิชาสถิติวิศวกรรม',
                code: '5791104+',
                date: '22 ต.ค. 2568',
                time: '13.00 - 16.00',
                room: '1356',
              ),
            ]),
            buildDateSection('วันศุกร์ที่ 24 ตุลาคม 2568', [
              buildExamCard(
                subjectName: 'วิชาพลเมืองเข้มแข็งและการต่อต้านการทุจริต',
                code: '---',
                date: '24 ต.ค. 2568',
                time: '9.00 - 11.00',
                room: 'หอประชุม',
              ),
            ]),
          ],
        ),
      ),
    );
  }
}