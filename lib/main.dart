import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/my_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);



  runApp( const ProviderScope(child: MyApp()));
}