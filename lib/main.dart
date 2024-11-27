import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/ActivityProvider.dart';
import 'package:flutter_application_1/Components/CommitteesProvider.dart';
import 'package:flutter_application_1/Register_Pages/login.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/screens/wllecom_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // تأكد من أنه يتم استدعاؤه قبل runApp
  debugPrint =
      (String? message, {int? wrapWidth}) {}; // تخصيص debugPrint قبل runApp

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ActivityProvider()), // تقديم ActivityProvider
        ChangeNotifierProvider(create: (context) => CommitteesProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                UserModel()..loadUser()), // تقديم CommitteesProvider
      ],
      child: const sakani_app(),
    ),
  );
}

class sakani_app extends StatelessWidget {
  const sakani_app({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(
          isAdmin: true,
        ),

        // إضافة ثيم التطبيق
        theme: ThemeData(
          // تحديد اللون الرئيسي للتطبيق
          primaryColor: Colors.blue,

          // تخصيص الألوان
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
          ),

          // تخصيص الأنماط النصية
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            bodyMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),

          // تخصيص الأزرار
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.blue, // لون الأزرار
            textTheme: ButtonTextTheme.primary, // نص الزر
          ),

          // تخصيص AppBar
          appBarTheme: const AppBarTheme(
            color: Colors.blue,
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
