import 'package:flowfin/api/auth.dart';
import 'package:flowfin/api/models/user.dart';
import 'package:flowfin/screens/auth/login.dart';
import 'package:flowfin/screens/tab_bar.dart';
import 'package:flowfin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoadingScreen extends StatefulWidget {
  final AuthAPI authAPI;
  final FlutterSecureStorage secureStorage;
  const LoadingScreen({
    super.key,
    required this.authAPI,
    required this.secureStorage,
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late final AuthService _authService;

  @override
  void initState() {
    _authService = AuthService(widget.authAPI, widget.secureStorage);
    checkAndLoad();

    super.initState();
  }

  Future<void> checkAndLoad() async {
    User? user = await _authService.initializeSession();
    if (user != null) {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen(authService: _authService, user: user);
            },
          ),
        );
      }
    } else {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen(authService: _authService);
            },
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color(0xFFf2e2e3);
    final accentColor = const Color(0xFFa188a6);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 8,
              color: accentColor,
              strokeCap: StrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}
