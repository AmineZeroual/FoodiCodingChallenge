import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foodi_coding_challenge/view/pages/HomePage/home_screen.dart';
import 'package:get/get.dart';
import 'controller/Bindings/Bindings.dart';
import 'model/constant.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataBindings().dependencies();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: DataBindings(),
      theme: ThemeData(
        fontFamily: "Roboto",
        iconTheme: const IconThemeData(color: kPrimaryColor, size: 25),
      ),
      home: NeumorphicApp(
          home: HomeScreen(),
          theme: const NeumorphicThemeData(
            depth: 10,
          )),
    );
  }
}
