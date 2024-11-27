import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/main_activity_page.dart';
import 'package:flutter_application_1/Admin/main_committees_page.dart';
import 'package:flutter_application_1/Register_Pages/login.dart';
import 'package:flutter_application_1/screens/AppInfoPage.dart';
import 'package:flutter_application_1/screens/Personal_Information_Details.dart';
import 'package:flutter_application_1/users/MainActivityPage_user.dart';
import 'package:flutter_application_1/users/MainCommitteesPage_user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final bool isAdmin; // لتحديد إذا كان المستخدم Admin
  const HomePage({super.key, required this.isAdmin});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // Access the UserModel to get user details
    final userModel = Provider.of<UserModel>(context);

    // تحميل بيانات المستخدم من SharedPreferences
    // Future<void> _loadUser() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   setState(() {
    //     userModel.username = prefs.getString('username') ?? 'Guest';
    //   });
    // }

    // قائمة الصفحات بناءً على نوع المستخدم
    final List<Widget> pages = widget.isAdmin
        ? [
            const Center(child: AppInfoPage()),
            const main_activity_page(), // صفحة الأنشطة للمسؤول
            const main_committees_page(), // صفحة اللجان للمسؤول
          ]
        : [
            const Center(child: AppInfoPage()),
            const MainActivityPage_user(), // صفحة الأنشطة للمستخدم
            const MainCommitteesPage_user(), // صفحة اللجان للمستخدم
          ];

    // قائمة Navigation Bar بناءً على نوع المستخدم
    final List<NavigationDestination> destinations = widget.isAdmin
        ? [
            const NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            const NavigationDestination(
              icon: Icon(Icons.work_outline),
              selectedIcon: Icon(Icons.work),
              label: 'Activity',
            ),
            const NavigationDestination(
              icon: Icon(Icons.groups_outlined),
              selectedIcon: Icon(Icons.groups),
              label: 'Committees',
            ),
          ]
        : [
            const NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            const NavigationDestination(
              icon: Icon(Icons.local_activity_outlined),
              selectedIcon: Icon(Icons.local_activity),
              label: 'Activity',
            ),
            const NavigationDestination(
              icon: Icon(Icons.people_outline),
              selectedIcon: Icon(Icons.people),
              label: 'Committees',
            ),
          ];

    return Scaffold(
      appBar: index == 0 // إظهار AppBar فقط في الصفحة الرئيسية
          ? AppBar(
              backgroundColor: const Color.fromARGB(255, 147, 234, 211),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/student.png', // المسار إلى الصورة
                    height: 40, // ارتفاع الصورة
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Welcome, ${userModel.username} in Sakani.app', // النص المعروض
                    style: const TextStyle(
                      fontSize: 18, // حجم الخط
                      fontWeight: FontWeight.bold, // يجعل النص عريضاً
                      color: Colors.black, // اللون
                    ),
                  ),
                ],
              ),
            )
          : null,
      drawer: Drawer(
        child: Consumer<UserModel>(
          builder: (context, userModel, child) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    userModel.username.isEmpty ? 'Guest' : userModel.username,
                  ),
                  accountEmail: Text(
                    userModel.email.isEmpty ? 'Not logged in' : userModel.email,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/student.png'),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Home',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context); // يغلق القائمة
                    setState(() {
                      index = 0; // الانتقال للصفحة الرئيسية
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    'Log in',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(Icons.app_registration),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const Login(), // الانتقال إلى شاشة Login
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Personal Information Details',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(Icons.info_outline),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                      return PersonalInformationDetails();
                    })); // يغلق القائمة
                    // إضافة عملية التنقل المطلوبة هنا
                  },
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        backgroundColor: const Color.fromARGB(255, 147, 234, 211),
        selectedIndex: index,
        onDestinationSelected: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        destinations: destinations, // قم بتمرير الوجهات حسب دور المستخدم
      ),
      body: Column(
        children: [
          Expanded(
            child: pages[index], // اختر الصفحة بناءً على الفهرس
          ),
        ],
      ),
    );
  }
}
