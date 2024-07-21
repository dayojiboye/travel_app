import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (fn) => runApp(const MyApp()),
  );
}
