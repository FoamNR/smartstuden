import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  // ✅ เพิ่มข้อมูลคณะและสาขา
  final String faculty = "คณะวิทยาศาสตร์และเทคโนโลยี";
  final String major = "สาขาวิทยาการคอมพิวเตอร์";
  final String name = "นายสมชาย ใจดี";
  final String id = "65xxxxxxxx";

  // ตัวอย่างข้อมูลแผนการเรียน
  final List<Map<String, dynamic>> studyPlan = [
    {
      'year': 'ภาคเรียน 1/2565 (ปี 1)',
      'courses': [
        {'code': 'GEN101', 'name': 'ภาษาอังกฤษพื้นฐาน', 'credit': "3(2-2-5)", 'status': 'ผ่าน'},
        {'code': 'MTH101', 'name': 'คณิตศาสตร์ทั่วไป', 'credit': "3(2-2-5)", 'status': 'ผ่าน'},
        {'code': 'SCI101', 'name': 'วิทยาศาสตร์พื้นฐาน', 'credit': "3(2-2-5)", 'status': 'กำลังเรียน'},
      ]
    },
    {
      'year': 'ภาคเรียน 2/2565 (ปี 1)',
      'courses': [
        {'code': 'COM101', 'name': 'พื้นฐานคอมพิวเตอร์', 'credit': "3(2-2-5)", 'status': 'ยังไม่ลงทะเบียน'},
        {'code': 'THA102', 'name': 'ภาษาไทยเพื่อการสื่อสาร', 'credit': "3(2-2-5)", 'status': 'ยังไม่ลงทะเบียน'},
        {'code': 'GEN102', 'name': 'มนุษย์กับสังคม', 'credit': "3(2-2-5)", 'status': 'ยังไม่ลงทะเบียน'},
      ]
    },
    {
      'year': 'ภาคเรียน 1/2566 (ปี 2)',
      'courses': [
        {'code': 'CSC201', 'name': 'โครงสร้างข้อมูล', 'credit': "3(2-2-5)", 'status': 'ยังไม่ลงทะเบียน'},
        {'code': 'CSC202', 'name': 'ฐานข้อมูลเบื้องต้น', 'credit': "3(2-2-5)", 'status': 'ยังไม่ลงทะเบียน'},
        {'code': 'GEN201', 'name': 'การคิดเชิงวิเคราะห์', 'credit': "3(2-2-5)", 'status': 'ยังไม่ลงทะเบียน'},
      ]
    },
    {
      'year': 'ภาคเรียน 2/2566 (ปี 2)',
      'courses': [
        {'code': 'CSC203', 'name': 'เครือข่ายคอมพิวเตอร์', 'credit': "3(2-2-5)", 'status': 'ยังไม่ลงทะเบียน'},
        {'code': 'CSC204', 'name': 'ระบบปฏิบัติการ', 'credit': "3(2-2-5)", 'status': 'ยังไม่ลงทะเบียน'},
        {'code': 'GEN202', 'name': 'คุณธรรมจริยธรรม', 'credit': "3(2-2-5)", 'status': 'ยังไม่ลงทะเบียน'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF00A9E0),
        title: const Text(
          "แผนการเรียน",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ✅ ส่วนแสดงคณะและสาขา
          Card(
            color: const Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "คณะ : $faculty",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF0078A3),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "สาขา : $major",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "ชื่อ : $name",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "รหัสนักศึกษา : $id",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ ส่วนของแผนการเรียน
          ...List.generate(
            studyPlan.length,
            (index) {
              final plan = studyPlan[index];
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.only(bottom: 20),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan['year'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF00A9E0),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(
                        plan['courses'].length,
                        (i) {
                          final course = plan['courses'][i];
                          return Column(
                            children: [
                              ListTile(
                                
                                title: Text("${course['code']} - ${course['name']}"),
                                subtitle: Text("${course['credit']} สถานะ: ${course['status']}"),
                              ),
                              if (i < plan['courses'].length - 1)
                                const Divider(height: 1, color: Colors.grey),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
