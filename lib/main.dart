import 'package:flowfin/api/auth.dart';
import 'package:flowfin/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

AuthAPI authAPI = AuthAPI();
FlutterSecureStorage secureStorage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlowFin',
      home: LoadingScreen(authAPI: authAPI, secureStorage: secureStorage),
    );
  }
}
