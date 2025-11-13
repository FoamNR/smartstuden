import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color primaryColor = Color(0xFF00A9E0);

class OfferedCoursesPage extends StatefulWidget {
  const OfferedCoursesPage({super.key});

  @override
  State<OfferedCoursesPage> createState() => _OfferedCoursesPageState();
}

class _OfferedCoursesPageState extends State<OfferedCoursesPage> {
  final List<Map<String, String>> _allCourses = [
    {
      "no": "1",
      "code": "1001802",
      "sec": "01",
      "name": "การฝึกปฏิบัติวิชาชีพระหว่างเรียน 1",
      "day": "พุธ",
      "period": "1-2",
      "room": "1326",
      "group": "การศึกษาปฐมวัย(ป.บั.)68 ค.01",
      "teacher": "ผศ.นิศากร บุญถนอม"
    },
    {
      "no": "2",
      "code": "1001802",
      "sec": "02",
      "name": "การฝึกปฏิบัติวิชาชีพระหว่างเรียน 1",
      "day": "จันทร์",
      "period": "3-4",
      "room": "EDSS1",
      "group": "ภาษาอังกฤษ(ศษ.บ.)68 ค.02",
      "teacher": "ผศ.ศศิธร รื่นจิตงาม"
    },
    {
      "no": "3",
      "code": "1001802",
      "sec": "03",
      "name": "การฝึกปฏิบัติวิชาชีพระหว่างเรียน 1",
      "day": "จันทร์",
      "period": "5-6",
      "room": "EDSS1",
      "group": "ภาษาอังกฤษ(ศษ.บ.)68 ค.03",
      "teacher": "ผศ.ศศิธร รื่นจิตงาม"
    },
    {
      "no": "4",
      "code": "1001802",
      "sec": "04",
      "name": "การฝึกปฏิบัติวิชาชีพระหว่างเรียน 1",
      "day": "จันทร์",
      "period": "7-8",
      "room": "0144",
      "group": "พลศึกษา(ศษ.บ.)68 ค.01",
      "teacher": "ผศ.นพมาศ วังบุญคง"
    },
    {
      "no": "5",
      "code": "1001802",
      "sec": "05",
      "name": "การฝึกปฏิบัติวิชาชีพระหว่างเรียน 1",
      "day": "จันทร์",
      "period": "1-2",
      "room": "0144",
      "group": "พลศึกษา(ศษ.บ.)68 ค.02",
      "teacher": "ผศ.นพมาศ วังบุญคง"
    },
    {
      "no": "6",
      "code": "1001802",
      "sec": "06",
      "name": "การฝึกปฏิบัติวิชาชีพระหว่างเรียน 1",
      "day": "อังคาร",
      "period": "5-6",
      "room": "0736",
      "group": "ประถมศึกษา(ศษ.บ.)68 ค.01",
      "teacher": "อ.สมศักดิ์ วิเศษทาน"
    },
    {
      "no": "7",
      "code": "1001802",
      "sec": "07",
      "name": "การฝึกปฏิบัติวิชาชีพระหว่างเรียน 1",
      "day": "อังคาร",
      "period": "7-8",
      "room": "0736",
      "group": "ประถมศึกษา(ศษ.บ.)68 ค.02",
      "teacher": "อ.สมศักดิ์ วิเศษทาน"
    },
    {
      "no": "8",
      "code": "1001802",
      "sec": "08",
      "name": "การฝึกปฏิบัติวิชาชีพระหว่างเรียน 1",
      "day": "อังคาร",
      "period": "8-9",
      "room": "A402",
      "group": "การศึกษาพิเศษ(ศษ.บ.)68 ค.01",
      "teacher": "อ.ธีรภัทร พงษ์ศรีศุภร"
    },
  ];

  List<Map<String, String>> _filteredCourses = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredCourses = _allCourses;
  }

  void _filterCourses(String query) {
    setState(() {
      _searchQuery = query;
      _filteredCourses = _allCourses.where((course) {
        final name = course["name"]!.toLowerCase();
        final code = course["code"]!.toLowerCase();
        final teacher = course["teacher"]!.toLowerCase();
        return name.contains(query.toLowerCase()) ||
            code.contains(query.toLowerCase()) ||
            teacher.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'รายวิชาที่เปิดสอน',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Column(
        children: [
          // 🔹 ภาคเรียน
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              children: const [
                Icon(Icons.school, color: primaryColor),
                SizedBox(width: 8),
                Text(
                  'ภาคการศึกษาที่ 2 / 2568',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // 🔹 ช่องค้นหา
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: _filterCourses,
              decoration: InputDecoration(
                hintText: 'ค้นหารายวิชา / รหัส / อาจารย์...',
                prefixIcon: const Icon(Icons.search, color: primaryColor),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () => _filterCourses(''),
                      )
                    : null,
              ),
            ),
          ),

          // 🔹 รายวิชา
          Expanded(
            child: _filteredCourses.isEmpty
                ? const Center(
                    child: Text(
                      'ไม่พบรายวิชาที่ค้นหา',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: _filteredCourses.length,
                    itemBuilder: (context, index) {
                      final course = _filteredCourses[index];
                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${course["no"]}. ${course["name"]}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildRow(Icons.code, 'รหัสวิชา: ${course["code"]} (SEC ${course["sec"]})'),
                              _buildRow(Icons.calendar_today, 'วันเรียน: ${course["day"]} | คาบ: ${course["period"]}'),
                              _buildRow(Icons.room, 'ห้องเรียน: ${course["room"]}'),
                              _buildRow(Icons.group, 'กลุ่มนักศึกษา: ${course["group"]}'),
                              _buildRow(Icons.person, 'อาจารย์ผู้สอน: ${course["teacher"]}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 18),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
