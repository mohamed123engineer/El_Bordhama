import 'package:flutter/material.dart';

class AddMedicineScreen extends StatelessWidget {
  const AddMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة دواء"),
        centerTitle: true,
      ),

      body: const Center(
        child: Text("صفحة إضافة دواء فاضية"),
      ),
    );
  }
}