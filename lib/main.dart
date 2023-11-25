import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/database/isar_local/setup/isar_setup.dart';
import 'package:v_chat/features/login/presentation/screens/login_screen.dart';

import 'utils/screen_route/screen_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await IsarSetup().setup();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final screenRoute = ScreenRoute();
    return MaterialApp(
      title: 'V-Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.routeAddress,
      onGenerateRoute: screenRoute.onGenerateRoute,
    );
  }
}
