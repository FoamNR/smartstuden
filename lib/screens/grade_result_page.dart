import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradeResultPage extends StatefulWidget {
  const GradeResultPage({super.key});

  @override
  State<GradeResultPage> createState() => _GradeResultPageState();
}

class _GradeResultPageState extends State<GradeResultPage> {
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
        title: const Text(
          'ผลการเรียน',
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ผลการเรียนเฉลี่ยรวม',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),

            // กล่องรวมทั้งสาม
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                        ],
                      ),
                      child: Column(
                        children: const [
                          Text("63.00",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold, color: Color(0XFF00A9E0))),
                          SizedBox(height: 6),
                          Text("หน่วยกิต", style: TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                        ],
                      ),
                      child: Column(
                        children: const [
                          Text("204.00",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold, color: Color(0XFF00A9E0))),
                          SizedBox(height: 6),
                          Text("ค่าระดับ", style: TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                        ],
                      ),
                      child: Column(
                        children: const [
                          Text("3.23",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold, color: Color(0XFF00A9E0))),
                          SizedBox(height: 6),
                          Text("เกรดเฉลี่ย", style: TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'ผลการเรียนตามภาคการศึกษา',
              style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            // หัวข้อภาคการศึกษา
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF4C637C),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: const Text(
                'ภาคการศึกษาที่ 2/2567',
                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),

            // กล่องรายละเอียด
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // แถวหน่วยกิต ค่าระดับ เกรดเฉลี่ย
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: const [
                            Text("3.00",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFF00A9E0))),
                            SizedBox(height: 5),
                            Text("หน่วยกิต", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Text("9.00",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFF00A9E0))),
                            SizedBox(height: 5),
                            Text("ค่าระดับ", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Text("3.00",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFF00A9E0))),
                            SizedBox(height: 5),
                            Text("เกรดเฉลี่ย", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  const Divider(),

                  // วิชา 1
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("การวิเคราะห์การลงทุนและการประกอบธุรกิจสำหรับคนรุ่นใหม่",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text("9042113   พื้นฐานมนุษย์   นก. 0",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // วิชา 2
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("พลเมืองเข้มแข็งและการต่อต้านการทุจริต",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text("9032911   พื้นฐานสังคม   นก. 3",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE6F6F8),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text("B",
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // วิชา 3
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("ระบบฐานข้อมูล", style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text("5792502   เอกบังคับ   นก. 0",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // วิชา 4
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("ระบบปฏิบัติการ", style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text("5792402   เอกบังคับ   นก. 0",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // วิชา 5
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("ไมโครคอนโทรลเลอร์", style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text("5792304   เอกบังคับ   นก. 0",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF4C637C),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: const Text(
                'ภาคการศึกษาที่ 1/2567',
                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),

            // กล่องรายละเอียด
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // แถวหน่วยกิต ค่าระดับ เกรดเฉลี่ย
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: const [
                            Text("3.00",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFF00A9E0))),
                            SizedBox(height: 5),
                            Text("หน่วยกิต", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Text("9.00",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFF00A9E0))),
                            SizedBox(height: 5),
                            Text("ค่าระดับ", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Text("3.00",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFF00A9E0))),
                            SizedBox(height: 5),
                            Text("เกรดเฉลี่ย", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  const Divider(),

                  // วิชา 1
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("การวิเคราะห์การลงทุนและการประกอบธุรกิจสำหรับคนรุ่นใหม่",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text("9042113   พื้นฐานมนุษย์   นก. 0",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE6F6F8),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text("A",
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // วิชา 2
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("พลเมืองเข้มแข็งและการต่อต้านการทุจริต",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text("9032911   พื้นฐานสังคม   นก. 3",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE6F6F8),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text("B",
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // วิชา 3
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("ระบบฐานข้อมูล", style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text("5792502   เอกบังคับ   นก. 0",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE6F6F8),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text("B",
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // วิชา 4
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("ระบบปฏิบัติการ", style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text("5792402   เอกบังคับ   นก. 0",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE6F6F8),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text("B",
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // วิชา 5
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("ไมโครคอนโทรลเลอร์", style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text("5792304   เอกบังคับ   นก. 0",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE6F6F8),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text("B",
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
