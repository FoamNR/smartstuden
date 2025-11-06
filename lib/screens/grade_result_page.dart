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
        title: const Text('ผลการเรียน', style: TextStyle(color: Colors.white)),
      ),
      body: Text('ผลการเรียน'),
    );
  }
}