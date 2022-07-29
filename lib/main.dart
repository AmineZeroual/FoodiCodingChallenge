import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'core/constant.dart';
import 'features/HomeScreen/presentation/pages/home_screen.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  NeumorphicApp
      (home: HomeScreen(),
      theme:const NeumorphicThemeData(
        depth: 10,
        iconTheme: IconThemeData(
          color: kPrimaryColor,
          size: 25
        ),
        buttonStyle: NeumorphicStyle(
          shape: NeumorphicShape.convex,
          depth: 10,
          intensity: 0.75,
        )
      ));
  }

}
// ThemeData(
//         splashColor: kPrimaryColor,
//         fontFamily:'Roboto',
//         appBarTheme: ThemeData.light().appBarTheme.copyWith(
//           backgroundColor: kBackGroundColor,
//           elevation: 0,
//           centerTitle: true,
//         ),
//         scaffoldBackgroundColor: kBackGroundColor,
//         colorScheme:
//         const ColorScheme.light().copyWith(primary: kPrimaryColor),
//       ),