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
      'name': 'คณะครุศาสตร์',
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = (constraints.maxWidth - 10) / 2; // 2 คอลัมน์
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: buildings.map((item) {
                      return SizedBox(
                        width: itemWidth,
                        child: Container(
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
                              // รูปภาพ
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  item['image']!,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(height: 6),

                              // ชื่อคณะ
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  item['name']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              const SizedBox(height: 2),

                              // หมายเลขอาคาร
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  item['number']!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 4),

                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                                height: 20,
                              ),

                              // ปุ่มดูแผนที่
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(bottom: 6),
                                child: TextButton.icon(
                                  onPressed: () {
                                    // TODO: เปิดแผนที่
                                  },
                                  icon: const Icon(Icons.map_outlined, size: 16),
                                  label: const Text(
                                    'ดูแผนที่',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  style: TextButton.styleFrom(
                                    foregroundColor: const Color(0XFF00A9E0),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
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
