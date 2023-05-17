import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/splash.view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('user');
  await Supabase.initialize(
      url: "https://gihgpgzukilittqwsqxv.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdpaGdwZ3p1a2lsaXR0cXdzcXh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzM1MjcxNDQsImV4cCI6MTk4OTEwMzE0NH0.qSwJKb8dBgDA8aWghwAslDXwf5wjjgzJANLlsdAiNdY");
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    builder: EasyLoading.init(),
  ));
}
