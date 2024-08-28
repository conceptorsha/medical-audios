import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_audios/routing/app_routings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical Audios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRouting.initialRoute,
      getPages: AppRouting.getPages,
    );
  }
}
