import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/route_builder.dart';
import 'package:flutter_bloc_todo_api_app/Core/app.dart';
import 'package:flutter_bloc_todo_api_app/View/Todo/main_todo_screen.dart';
import 'package:flutter_offline/flutter_offline.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Movies Demo' ,
      restorationScopeId: 'root' ,
      onGenerateRoute: RouteGenerators.onGenerate ,
      theme: ThemeData.light() ,

      home: OfflineBuilder(
          connectivityBuilder: (
              BuildContext context ,
              ConnectivityResult connectivity ,
              Widget child ,
              ) {
            final bool connected = connectivity != ConnectivityResult.none;
            return App.conditional(
                condition: connected,
                builder: (BuildContext context) => const MainTodoScreen() ,
                fallback: (BuildContext context) => App.offlineBuilderScreen
            );
          } ,
          child: App.offlineWidget
      ) ,
    );
  }
}