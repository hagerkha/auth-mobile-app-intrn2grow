import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:login/pages/login_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !const bool.fromEnvironment('dart.vm.product'),
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home:LoginPage(), // استبدل بـ LoginPage
    );
  }
}
