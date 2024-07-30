import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oswal/pages/auth/login_page.dart';
import 'package:oswal/theme/theme.dart';
import 'package:oswal/utils/message.dart';
import 'package:oswal/utils/routs.dart';

import 'utils/binding.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize GetStorage
  await GetStorage.init();

  // Initialize Firebase API
  await FirebaseApi().init(); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      title: 'Oswal Pump',
      getPages: AppRouts.routes,
      initialBinding: AllBinding(),
      initialRoute: AppRouts.initialRoute,
      home:
          const LoginPage(),
    );
  }
}
