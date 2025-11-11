import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color primaryColor = Color(0xFF00A9E0);

// --- Model ---
class ElectiveCourse {
  final String code, name, credits, instructor;
  final int capacity, enrolled;
  bool get isFull => enrolled >= capacity;
  int get remainingSlots => capacity - enrolled;

  const ElectiveCourse({
    required this.code,
    required this.name,
    required this.credits,
    required this.instructor,
    required this.capacity,
    required this.enrolled,
  });
}

const mockCourses = [
  ElectiveCourse(
    code: 'GEN101',
    name: 'ศิลปะกับการดำเนินชีวิต',
    credits: "3(2-2-5)",
    instructor: 'ดร. สมชาย ใจดี',
    capacity: 60,
    enrolled: 55,
  ),
  ElectiveCourse(
    code: 'BUS205',
    name: 'การเงินส่วนบุคคล',
    credits: "3(2-2-5)",
    instructor: 'ผศ. มณีรัตน์ งามสม',
    capacity: 45,
    enrolled: 45,
  ),
  ElectiveCourse(
    code: 'TECH302',
    name: 'โลกของ AI',
    credits: "3(2-2-5)",
    instructor: 'รศ. ประยุทธ์ วิทยา',
    capacity: 70,
    enrolled: 15,
  ),
  ElectiveCourse(
    code: 'ENV401',
    name: 'ภาวะโลกร้อนและอนาคต',
    credits: "3(2-2-5)",
    instructor: 'อ. พัชรี แสงธรรม',
    capacity: 50,
    enrolled: 30,
  ),
  ElectiveCourse(
    code: 'LANG110',
    name: 'ภาษาเกาหลีเบื้องต้น',
    credits: "3(2-2-5)",
    instructor: 'ศ. คิม ซูฮยอน',
    capacity: 30,
    enrolled: 29,
  ),
];

// --- Main Screen ---
class BookingElective extends StatefulWidget {
  const BookingElective({super.key});
  @override
  State<BookingElective> createState() => _BookingElectiveState();
}

class _BookingElectiveState extends State<BookingElective> {
  String _searchQuery = '';

  List<ElectiveCourse> get _filteredCourses {
    if (_searchQuery.isEmpty) return mockCourses;
    final q = _searchQuery.toLowerCase();
    return mockCourses
        .where(
          (c) =>
              c.name.toLowerCase().contains(q) ||
              c.code.toLowerCase().contains(q) ||
              c.instructor.toLowerCase().contains(q),
        )
        .toList();
  }

  void _confirmBooking(ElectiveCourse c) => showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('ยืนยันการจอง'),
      content: Text('ต้องการจองวิชา ${c.code}: ${c.name} ใช่หรือไม่?'),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('ยกเลิก'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('จองวิชา ${c.code} สำเร็จ! (ระบบจำลอง)'),
                backgroundColor: Colors.green,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
          child: const Text('ยืนยัน'),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: primaryColor,
      title: const Text(
        'จองรายวิชาเสรี',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              onChanged: (v) => setState(() => _searchQuery = v),
              decoration: InputDecoration(
                hintText: 'ค้นหารายวิชา (ชื่อ, รหัส, อาจารย์)',
                prefixIcon: const Icon(Icons.search, color: primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
        ),
        Expanded(
          child: _filteredCourses.isEmpty
              ? const Center(child: Text('ไม่พบรายวิชาที่ค้นหา'))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _filteredCourses.length,
                  itemBuilder: (_, i) => _CourseCard(
                    course: _filteredCourses[i],
                    onBook: _confirmBooking,
                  ),
                ),
        ),
      ],
    ),
  );
}

// --- Course Card ---
class _CourseCard extends StatelessWidget {
  final ElectiveCourse course;
  final Function(ElectiveCourse) onBook;
  const _CourseCard({required this.course, required this.onBook});

  @override
  Widget build(BuildContext context) {
    final full = course.isFull;
    final statusColor = full ? Colors.red : Colors.green;
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  course.code,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    full ? 'เต็ม' : 'ว่าง',
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              course.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Divider(height: 20),
            Row(
              children: [
                const Icon(Icons.book, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  course.credits,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.person, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  course.instructor,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'รับ: ${course.capacity} | จอง: ${course.enrolled} | คงเหลือ: ${course.remainingSlots}',
              style: TextStyle(
                fontSize: 14,
                color: course.remainingSlots <= 5 && !full
                    ? Colors.orange
                    : Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: full ? null : () => onBook(course),
                icon: const Icon(Icons.note_add_rounded, size: 20),
                label: Text(full ? 'เต็ม' : 'จองวิชานี้'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: full ? Colors.grey[300] : primaryColor,
                  foregroundColor: full ? Colors.grey[600] : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
