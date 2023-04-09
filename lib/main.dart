import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sportmap/slot_screen.dart';
import 'welcome_screen.dart';
import 'map_screen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'booking_menu.dart';
import 'bookingslot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'login_screen': (context) => LoginScreen(),
        'map_screen': (context) => MapScreen(),
        'booking_menu': (context) => BookingMenu(),
        'bookingslot': (context) => BookingSlot()
        //'slot_screen': (context) => SlotScreen()
      },
    );
  }
}
