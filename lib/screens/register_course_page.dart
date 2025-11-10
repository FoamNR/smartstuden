import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // สีหลักของธีม
  static const Color primaryColor = Color(0XFF00A9E0);
  static const Color backgroundColor = Color(0xFFF5F9FC);

  final List<Map<String, dynamic>> availableCourses = [
    {'code': 'CSC201', 'name': 'โครงสร้างข้อมูล', 'credit': "3(2-2-5)", 'creditValue': 3},
    {'code': 'CSC202', 'name': 'ฐานข้อมูลเบื้องต้น', 'credit': "3(2-2-5)", 'creditValue': 3},
    {'code': 'CSC203', 'name': 'ระบบปฏิบัติการ', 'credit': "3(2-2-5)", 'creditValue': 3},
    {'code': 'GEN201', 'name': 'การคิดเชิงวิเคราะห์', 'credit': "3(2-2-5)", 'creditValue': 3},
    {'code': 'ENG101', 'name': 'ภาษาอังกฤษพื้นฐาน', 'credit': "3(3-0-6)", 'creditValue': 3},
    {'code': 'MAT101', 'name': 'คณิตศาสตร์สำหรับคอมพิวเตอร์', 'credit': "3(3-0-6)", 'creditValue': 3},
  ];

  final List<Map<String, dynamic>> selectedCourses = [];

  int get totalSelectedCredits =>
      selectedCourses.fold(0, (sum, course) => sum + (course['creditValue'] as int));

  void toggleCourse(Map<String, dynamic> course) {
    setState(() {
      final exists = selectedCourses.any((item) => item['code'] == course['code']);
      exists
          ? selectedCourses.removeWhere((item) => item['code'] == course['code'])
          : selectedCourses.add(course);
    });
  }

  void registerCourses() {
    if (selectedCourses.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("กรุณาเลือกรายวิชาอย่างน้อย 1 รายวิชาเพื่อลงทะเบียน"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final totalCredits = totalSelectedCredits;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "ลงทะเบียนสำเร็จ: ${selectedCourses.length} รายวิชา (รวม $totalCredits หน่วยกิต)"),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
    setState(() => selectedCourses.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('ลงทะเบียนเรียน',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header ส่วนข้อมูล ปี/เทอม
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            decoration: const BoxDecoration(
              color: primaryColor,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("ภาคเรียนที่ 1/2568",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
                const SizedBox(height: 5),
                Text("เลือกรายวิชาที่คุณต้องการลงทะเบียน",
                    style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8))),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(5)),
                  child: Text("รวมหน่วยกิตที่เลือก: $totalSelectedCredits หน่วยกิต",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("รายวิชาที่เปิดสอน",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: primaryColor)),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: availableCourses.length,
              itemBuilder: (context, index) {
                final course = availableCourses[index];
                final isSelected =
                    selectedCourses.any((item) => item['code'] == course['code']);

                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: isSelected ? primaryColor : Colors.grey.shade300, width: isSelected ? 2 : 1),
                  ),
                  elevation: isSelected ? 4 : 1,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    title: Text("${course['code']}: ${course['name']}",
                        style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? primaryColor : Colors.black87)),
                    subtitle: Text("หน่วยกิต: ${course['credit']}"),
                    trailing: Checkbox(activeColor: primaryColor, value: isSelected, onChanged: (_) => toggleCourse(course)),
                    onTap: () => toggleCourse(course),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -5))]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                ),
                icon: const Icon(Icons.check_circle, color: Colors.white),
                label: const Text("ยืนยันการลงทะเบียน",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                onPressed: registerCourses,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                ),
                icon: const Icon(Icons.add_circle, color: Colors.white),
                label: const Text("การลงทะเบียนเพิ่ม",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("ฟังก์ชัน 'การลงทะเบียนเพิ่ม' อยู่ระหว่างการพัฒนา"),
                        backgroundColor: Colors.grey,
                        duration: Duration(seconds: 1)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
