import 'package:cellula_project/core/di/dependancy_injection.dart';
import 'package:cellula_project/core/helper/shared_prefrances_helper.dart';
import 'package:cellula_project/firebase_options.dart';
import 'package:cellula_project/my_app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupGetIt();
  await SharedPreferencesHelper.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}
