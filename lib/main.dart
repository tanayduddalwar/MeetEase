import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meetease/firebase_options.dart';
import 'package:meetease/resources/auth_methods.dart';
import 'package:meetease/screens/home_screen.dart';
import 'package:meetease/screens/login_screen.dart';
import 'package:meetease/screens/video_call_screen.dart';
import 'package:meetease/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   // name: "PBL Sem-4",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
         '/home': (context) => const HomeScreen(),
        '/video-call': (context) => const VideoCallScreen(),
      },
     // home: const LoginScreen(),
      home: StreamBuilder(
      stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          }

          return const LoginScreen();
        },
      ),
    );
  }
}