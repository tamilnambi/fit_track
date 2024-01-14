import 'package:fit_track/providers/activityProvider.dart';
import 'package:fit_track/screens/homePage.dart';
import 'package:fit_track/screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ActivityProvider(),
    builder:(context,child){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MainPage(),
    theme: ThemeData(
    textTheme: GoogleFonts.robotoTextTheme(),
    ),
    );
    });
  }
}
