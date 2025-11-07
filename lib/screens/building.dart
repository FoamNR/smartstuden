import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildingPage extends StatefulWidget {
  const BuildingPage({super.key});

  @override
  State<BuildingPage> createState() => _BuildingPageState();
}

class _BuildingPageState extends State<BuildingPage> {
  final List<Map<String, String>> buildings = [
    {
      'name': 'คณะครุศาสตร์ (สำนักงาน)',
      'number': 'หมายเลขอาคาร: 01',
      'image': 'assets/images/building1.jpg',
    },
    {
      'name': 'คณะมนุษยศาสตร์',
      'number': 'หมายเลขอาคาร: 02',
      'image': 'assets/images/building2.jpg',
    },
    {
      'name': 'คณะวิทยาศาสตร์',
      'number': 'หมายเลขอาคาร: 03',
      'image': 'assets/images/building3.jpg',
    },
    {
      'name': 'คณะมนุษยศาสตร์',
      'number': 'หมายเลขอาคาร: 04',
      'image': 'assets/images/building4.jpg',
    },
    {
      'name': 'คณะวิทยาศาสตร์',
      'number': 'หมายเลขอาคาร: 05',
      'image': 'assets/images/building3.jpg',
    },
    {
      'name': 'สถาบันภาษา-ห้องปรับพื้นฐาน',
      'number': 'หมายเลขอาคาร: 06',
      'image': 'assets/images/building1.jpg',
    },
  ];

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
            // หัวข้อ
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(13),
              child: const Text(
                'อาคารภายในมหาวิทยาลัยฯ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // แสดงรายการอาคาร
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 คอลัมน์
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9, // อัตราส่วนกรอบ
                ),
                itemCount: buildings.length,
                itemBuilder: (context, index) {
                  final item = buildings[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // รูปภาพ
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            item['image']!,
                            height: 130,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // ชื่อคณะ
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            item['name']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(height: 3),

                        // หมายเลขอาคาร
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            item['number']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),

                        const Spacer(),

                        // ปุ่มดูแผนที่
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 8),
                          child: TextButton.icon(
                            onPressed: () {
                              // TODO: เพิ่มการเปิดแผนที่ของอาคารนี้
                            },
                            icon: const Icon(Icons.map_outlined, size: 16),
                            label: const Text(
                              'ดูแผนที่',
                              style: TextStyle(fontSize: 13),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0XFF00A9E0),
                            ),
                          ),
                        ),
                      ],
                    ),
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
