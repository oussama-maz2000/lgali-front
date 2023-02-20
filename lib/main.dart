import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'splash/splash.view.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Supabase.initialize(
      url: "https://gihgpgzukilittqwsqxv.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdpaGdwZ3p1a2lsaXR0cXdzcXh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzM1MjcxNDQsImV4cCI6MTk4OTEwMzE0NH0.qSwJKb8dBgDA8aWghwAslDXwf5wjjgzJANLlsdAiNdY");

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashView(),
  ));
}
