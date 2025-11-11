import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class PaymentRecord {
  final int id;
  final String studentId, name, major, receiptNo, date, semester, registrationNo, status, receiptLink;
  final double amount;

  PaymentRecord({
    required this.id,
    required this.studentId,
    required this.name,
    required this.major,
    required this.receiptNo,
    required this.date,
    required this.amount,
    required this.semester,
    required this.registrationNo,
    required this.status,
    required this.receiptLink,
  });
}

class _PaymentPageState extends State<PaymentPage> {
  static const Color primaryColor = Color(0XFF00A9E0);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color pendingColor = Color(0xFFD32F2F);

  final List<PaymentRecord> _payments = [
    PaymentRecord(
      id: 1,
      studentId: '65xxxxxxxx',
      name: 'นายสมชาย ใจดี',
      major: 'สาขาวิชา วิทยาการคอมพิวเตอร์',
      receiptNo: '6880030337',
      date: '15/09/2566',
      amount: 7800,
      semester: '1/2566',
      registrationNo: '10787',
      status: 'ออกใบเสร็จแล้ว eB25681103',
      receiptLink: 'สำเนา',
    ),
    PaymentRecord(
      id: 2,
      studentId: '65xxxxxxxx',
      name: 'นายสมชาย ใจดี',
      major: 'สาขาวิชา วิทยาการคอมพิวเตอร์',
      receiptNo: '6880015360',
      date: '03/02/2566',
      amount: 10450,
      semester: '2/2565',
      registrationNo: '10606',
      status: 'ยังไม่ออกใบเสร็จ (พิมพ์ใบเสร็จได้ครั้งเดียว)',
      receiptLink: 'ต้นฉบับ',
    ),
    PaymentRecord(
      id: 3,
      studentId: '65xxxxxxxx',
      name: 'นายสมชาย ใจดี',
      major: 'สาขาวิชา วิทยาการคอมพิวเตอร์',
      receiptNo: '6700013807',
      date: '18/09/2567',
      amount: 10400,
      semester: '1/2567',
      registrationNo: '12215',
      status: 'ออกใบเสร็จแล้ว 150746',
      receiptLink: 'สำเนา',
    ),
    PaymentRecord(
      id: 4,
      studentId: '65xxxxxxxx',
      name: 'นายสมชาย ใจดี',
      major: 'สาขาวิชา วิทยาการคอมพิวเตอร์',
      receiptNo: '6780013609',
      date: '15/02/2567',
      amount: 10400,
      semester: '2/2566',
      registrationNo: '09846',
      status: 'ยังไม่ออกใบเสร็จ (พิมพ์ใบเสร็จได้ครั้งเดียว)',
      receiptLink: 'ต้นฉบับ',
    ),
  ];

  Widget _detailRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 110,
              child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
            Expanded(child: Text(value, style: const TextStyle(color: Colors.black54))),
          ],
        ),
      );

  Widget _paymentCard(PaymentRecord r) {
    final isIssued = r.status.contains('ออกใบเสร็จแล้ว');
    final color = isIssued ? successColor : pendingColor;
    final icon = r.receiptLink == 'ต้นฉบับ' ? Icons.print : Icons.copy;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Text(r.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
            ),
            Text('฿ ${r.amount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ]),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color),
            ),
            child: Text(r.status.split('(').first.trim(),
                style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 13)),
          ),
          const Divider(height: 20),
          _detailRow('รหัส/สาขา :', '${r.studentId} | ${r.major}'),
          _detailRow('วันที่ชำระเงิน :', r.date),
          _detailRow('เลขที่ใบเสร็จ :', r.receiptNo),
          _detailRow('เทอม/เลขทะเบียน :', '${r.semester} | ${r.registrationNo}'),
          const Divider(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text('พิมพ์ใบเสร็จ (${r.receiptLink})', style: TextStyle(color: primaryColor)),
            IconButton(
              icon: Icon(icon, color: primaryColor),
              onPressed: () => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('กำลังพิมพ์ใบเสร็จรายการที่ ${r.id}'))),
            ),
          ]),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FC),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('รายการชำระเงิน', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _payments.isEmpty
          ? const Center(child: Text('ไม่พบรายการชำระเงิน'))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _payments.length,
              itemBuilder: (_, i) => _paymentCard(_payments[i]),
            ),
    );
  }
}
