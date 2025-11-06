import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage({super.key});

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  String? selectedYear = '2/2567';
  final List<String> years = ['1/2567', '2/2567', '1/2568', '2/2568'];

  Widget buildSubjectCard({
    required String subjectName,
    required String teacher,
    required String time,
    required String code,
    required String room,
    required String period,
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
          // อาจารย์และเวลา
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ผู้สอน : $teacher',
                style: const TextStyle(color: Colors.black87),
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
          Text('ห้องเรียน : $room', style: const TextStyle(color: Colors.black87)),
          Text('คาบที่ : $period', style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }

  Widget buildDaySection(String day, List<Widget> subjects) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E2E2E),
            ),
          ),
          const SizedBox(height: 8),
          subjects.isNotEmpty
              ? Column(children: subjects)
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('ไม่พบชั่วโมงเรียนในวันนี้',
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
        title: const Text('ตารางเรียน', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ส่วนหัวนักศึกษา + dropdown
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
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ตารางเรียนแต่ละวัน
            buildDaySection('วันจันทร์', []),
            buildDaySection('วันอังคาร', [
              buildSubjectCard(
                subjectName: 'วิชาวงจรดิจิทัล',
                teacher: 'อ.ณรงค์ เครือกันทา',
                time: '8.00 - 12.00',
                code: '5791302',
                room: '1353',
                period: '1 - 4',
              ),
              buildSubjectCard(
                subjectName: 'วิชาระบบฐานข้อมูล',
                teacher: 'อ.เมธาวัตน์ กาวิละเครือ',
                time: '13.00 - 17.00',
                code: '5792502',
                room: '1356',
                period: '6 - 9',
              ),
            ]),
            buildDaySection('วันพุธ', [
              buildSubjectCard(
                subjectName: 'วิชาสถิติวิศวกรรม',
                teacher: 'อ.ดร.ภูวสิษฐ์ ตุ้นแก้ว',
                time: '8.00 - 12.00',
                code: '5791104+',
                room: '1356',
                period: '1 - 4',
              ),
            ]),
            buildDaySection('วันพฤหัสบดี', [
              buildSubjectCard(
                subjectName:
                    'วิชาพลเมืองเข้มแข็งและการต่อต้านการทุจริต',
                teacher: 'อ.ไกรสร คำพูล',
                time: '8.00 - 12.00',
                code: '---',
                room: '---',
                period: '---',
              ),
            ]),
            buildDaySection('วันศุกร์', [
              buildSubjectCard(
                subjectName:
                    'วิชาพลเมืองเข้มแข็งและการต่อต้านการทุจริต',
                teacher: 'อ.ไกรสร คำพูล',
                time: '8.00 - 12.00',
                code: '---',
                room: '---',
                period: '---',
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
