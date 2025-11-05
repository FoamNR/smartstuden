import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0XFF00A9E0),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // Android → สีขาว
          statusBarBrightness: Brightness.dark, // iOS → สีขาว
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // หัวข้อส่วนบัญชี
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(10),
              child: const Text(
                'บัญชี',
                style: TextStyle(fontSize: 18, color: Color(0xFF7C7C7C)),
              ),
            ),

            // กล่องโปรไฟล์
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(50),
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'นายสมชาย ใจดี',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF00A9E0),
                        ),
                      ),
                      Text(
                        'รหัสนักศึกษา : 65xxxxxxxx',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'สาขาวิทยาการคอมพิวเตอร์',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'คณะวิทยาศาสตร์และเทคโนโลยี',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 190,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0XFF00A9E0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(

                            children: [
                              Padding(padding: const EdgeInsets.all(5)),
                              Icon(
                                
                                Icons.date_range,
                                color: Colors.white,
                                size: 40,
                                
                              ),
                              Text("ตารางเรียน", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),),
                              Text("ดูผลการเรียนของฉัน" ,style: TextStyle(color: Colors.white ,fontSize: 14),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 190,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(

                            children: [
                              Padding(padding: const EdgeInsets.all(5)),
                              Text('A+', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Color(0XFF00A9E0)),),
                              Text("ตารางเรียน", style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold,fontSize: 18),),
                              Text("ดูผลการเรียนของฉัน" ,style: TextStyle(color: Colors.grey ,fontSize: 14),)
                            ],
                          ),
                        ),
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
