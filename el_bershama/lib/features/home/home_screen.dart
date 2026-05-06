import 'package:el_bershama/core/style/colors_manger.dart';
import 'package:el_bershama/core/style/styles_manger.dart';
import 'package:el_bershama/core/widgets/button_widget.dart';
import 'package:el_bershama/features/account/accountScreen.dart';
import 'package:el_bershama/features/alarm/alrmScreen.dart';
import 'package:el_bershama/features/medicine/medicien.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 3;

  void navigate(int index, BuildContext context) {

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AccountScreen()),
      );
    } 
    else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AlarmScreen()),
      );
    } 
    else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MedicineScreen()),
      );
    }

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.withColor,

      appBar: AppBar(
        backgroundColor: ColorsManger.withColor,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.notifications),
              SizedBox(width: 170),
              Text('مرحبًا اهلا بك '),

            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: ColorsManger.primaryColor,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'لا تنسَ دواءك',
                          style: StylesManger.white20Bold,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'نحن هنا لمساعدتك على \n تذكير مواعيد أدويتك',
                          style: StylesManger.white14,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'images/bersham.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 300),

            ButtonWidget(
             onpress: () {
             Navigator.pushNamed(context, 'addMedicine');
              },
             text: "اضافة دواء جديد",
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsManger.withColor,
        currentIndex: currentIndex,

        selectedItemColor: ColorsManger.primaryColor,
        unselectedItemColor: Colors.grey,

        onTap: (index) => navigate(index, context),

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "الحساب",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: "التنبيهات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: "الأدوية",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "الرئيسية",
          ),
        ],
      ),
    );
  }
}